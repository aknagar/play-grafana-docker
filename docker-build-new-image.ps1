param(
    [string]$repo = "aknagar/grafana",
    [string]$version = "0.0.3"
)

$newTag = $repo + ":" + $version;
# Build a new container image
docker build --tag $newTag --no-cache=true .
