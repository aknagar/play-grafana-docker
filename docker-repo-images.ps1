# View all images of a repostiory stored on the local system
param(
    [string] $repo = "aknagar/grafana"
)

docker images $repo