#cloud-config
echo "##################################################################################"
echo "##### EJ's user_data.sh ##########################################################"
echo "##################################################################################"
touch /tmp/ej_was_here.txt
echo "ej_was_inside_the_file" >> /tmp/ej_was_here.txt
echo "##################################################################################"
#package_update: true
#package_upgrade: true
#packages:
sudo yum upgrade python-pip jq bc git httpd6 php56-mysqlnd httpd
  echo "##################################################################################"
  echo "##### copy keys ##################################################################"
  echo "##################################################################################"
  sudo cp /home/ec2-user/.ssh/ej_key_pair.pem /root/.ssh/ej_key_pair.pem
  sudo chmod -v 400 /root/.ssh/*

sudo yum install -y gcc-c++ python-devel python-setuptools
sudo pip install --upgrade pip

sudo /usr/local/bin/pip install pyserial

sudo /usr/local/bin/pip install PrettyTable

sudo /usr/local/bin/pip install oauth
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install cheetah ####################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install cheetah
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install argparse ###################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install argparse
sudo /usr/local/bin/pip install --ignore-installed airflow[s3,hive,python]
echo "##################################################################################"
echo "##### airflow initdb #############################################################"
echo "##################################################################################"
airflow initdb
echo "##################################################################################"
echo "##### nohup airflow webserver ####################################################"
echo "##################################################################################"
nohup airflow webserver
exit 0
