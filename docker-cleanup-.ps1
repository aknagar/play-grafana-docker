$containerId = 'abc'
$image = 'aknagar/grafana:0.0.1'
# Remove container
docker rm $containerId

# Remove image
docker rmi $image
