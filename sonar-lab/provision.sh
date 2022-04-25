#/usr/bin/bash
useradd sonar
sudo su -
sudo yum install wget java-11-openjdk-devel -y
sudo yum install unzip
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
sudo unzip sonarqube-9.4.0.54424.zip -d /opt/
sudo mv /opt/sonarqube-9.4.0.54424.zip /opt/sonarqube
sudo chown -R sonar:sonar /opt/sonarqube
sudo touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
sudo cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT

service sonar start

#instalar sonar scanner

sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
sudo unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
sudo mv /opt/sonar-scanner-cli-4.7.0.2747-linux.zip /opt/sonar-scanner
sudo chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs

#--------------comandos--------------
# ps aux | grep java
# sudo service sonar status