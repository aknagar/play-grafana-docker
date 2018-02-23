# On Windows 10, switch docker client to Linux containers

# docker run -d -p 3000:3000 grafana/grafana

# The default HTTP port is 3000 and default user and group is admin.

# Username/Password: admin/admin

# Check running container
docker container ps

# Stop containter
docker stop 96

# enter into container
docker exec -it 96 bash

cd /var/lib/grafana/plugins

docker inspect e8

docker volume ls

# mount host drive folder
# The folder should be empty
docker run `
    -d `
    -p 3000:3000 `
    --name grafana `
    -v D:\OneDrive\grafana:/var/lib/grafana `
    -e "GF_INSTALL_PLUGINS=grafana-azure-monitor-datasource,grafana-simple-json-datasource" `
    grafana/grafana:latest

docker stop mygrafana
docker start mygrafana

# remove container
docker rm mygrafana

docker ps --all

# Create an image. Note DOT at end
docker build --tag aknagar/grafana:0.0.1 --no-cache=true .

docker run `
    -d `
    -p 3000:3000 `
    --name mygrafana `
    -v D:\OneDrive\grafana:/var/lib/grafana `
    -e "GF_INSTALL_PLUGINS=grafana-azure-monitor-datasource,grafana-simple-json-datasource" `
    aknagar/grafana:0.0.1

docker volume prune

docker system prune

docker ps --all
docker images

docker container commit `
    --author aknagar `
    --message "Testing commit" `
    mygrafana `
    testcommit


docker ps --all

docker images aknagar/grafana

