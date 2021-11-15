#!/bin/bash - 

set -o nounset                              # Treat unset variables as an error

sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo amazon-linux-extras install epel
sudo yum upgrade

# Bring over files needed


sudo yum install yum-utils jq git jenkins java-1.8.0-openjdk-devel -y
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins


sudo yum install docker -y
sudo groupadd docker
sudo usermod -aG docker ec2-user
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 777 /var/run/docker.sock
