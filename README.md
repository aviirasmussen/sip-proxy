# sip-proxy

Installs a Kamailio SIP Proxy with ten users, see Dockerfile for SIP Proxy user details.

## Reference installation

 - Ubuntu 20.04.1 LTS (Focal Fossa).

## Ubuntu
sudo apt update
sudo apt upgrade
sudo apt install net-tools
sudo apt install docker.io
sudo apt install <your choise if editor>
sudo systemctl enable --now docker
sudo usermod -aG docker <your ubuntu username>
### check version
docker --version
## Docker
### Build image
docker build . -t sentral  --no-cache  
### Check container image
docker ps -a
### Run Docker container
docker run -rm --name sentral --hostname telefonserver --restart unless-stopped -d --net host sentral
## Comon docker commands used during development
### Shop servers listing
netstat -tunlp
### Look at SIP messages 
sudo ngrep -d <your interface> -W byline port 5060
### Look at docker logs for the image
docker logs sentral

