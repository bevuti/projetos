#!/usr/bin/env bash
sudo yum install epel-release -y
sudo yum install wget git -y
sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo yum install java-11-openjdk -y
echo "INSTALANDO JEKINS E DEPENDENCIAS - CONSEGUINDO PROSSEGUIR SEM ERRO"
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
echo "---------------------INICIANDO JENKINS ---------------------------"
sudo systemctl enable jenkins
##instala docker compose
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo systemctl daemon-reload
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
echo "------------------- DOCKER PASSOU -------------------------------"
sudo systemctl daemon-reload
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "------------------- COMPOSE PASSOU -------------------------------"
sudo systemctl daemon-reload
usermod -aG docker jenkins


#Comando para pegar senha jenkins
# cat /var/lib/jenkins/secrets/initialAdminPassword
# e3acd4b33123462a9096f072dd4f8e7c

#hsvp
#29f5a29445d2407d82d8e5d5672de477
