# sip-proxy

Installs a Kamailio SIP Proxy with ten users, see Dockerfile for SIP Proxy user details.

## Reference installation

 - Ubuntu 20.04.1 LTS (Focal Fossa).

## Ubuntu
 - sudo apt update
 - sudo apt upgrade
 - sudo apt install net-tools
 - sudo apt install docker.io
 - sudo apt install <your choise if editor>
 - sudo systemctl enable --now docker
 - sudo usermod -aG docker <your ubuntu username>
 - sudo systemctl enable docker.service
 - sudo systemctl enable containerd.service
 - sudo systemctl start docker.servic

exit terminal and login again, then test your docker with the hello-world image
 - docker run hello-world
 
### check version
docker --version
## Docker
### Build image
docker build . -t sentral  --no-cache  
### Check container image
docker ps -a
### Run Docker container
docker run --name sentral --hostname telefonserver --restart unless-stopped -d --net host sentral
### Stop and Remove Docker image
 - docker stop sentral
 - docker container rm -f sentral
## Comon docker commands used during development
### Show servers listing
netstat -tunlp
### Look at SIP messages 
sudo ngrep -d <your interface> -W byline port 5060
### Look at docker logs for the image
docker logs sentral
### Log into container
docker exec -i -t sentral /bin/ash
