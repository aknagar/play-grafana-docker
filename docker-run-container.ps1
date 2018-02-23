param(
    [string] $version = '0.0.3'
)

$image = "aknagar/grafana" + ":" + $version;
Write-Debug $image

# Run container
docker container run -d -p 3000:3000 --name mygrafana $image