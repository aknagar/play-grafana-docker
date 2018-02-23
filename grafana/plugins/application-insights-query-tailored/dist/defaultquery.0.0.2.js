var DefaultQuery = `
let availability = requests | where operation_SyntheticSource == "Application Insights Availability Monitoring" 
| project is_available = iff(success == "True",1 ,0 ), appId 
| summarize Availability=sum(toint(is_available))*100.0/count() by appId;        
let sla = 3000;
requests
| where resultCode !in ("400", "401", "402", "403", "404", "409")
| where operation_SyntheticSource != "Application Insights Availability Monitoring" 
| extend is_reliable = iff(success == "True",1 ,0), is_performant = iff(success == "True" and duration<=sla,1,0)
| summarize Reliability=sum(todouble(is_reliable))*100.0/count(), Performance = sum(todouble(is_performant))*100.0/count() by appId
| join kind= leftouter (
availability 
) on appId
| project Component='{0}', Service='{1}',         
    Availability = Availability,
    Reliability = Reliability,
    Performance = Performance
`;