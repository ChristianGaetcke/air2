#cloud-config
echo "##################################################################################"
echo "##### airflow_user_data.sh #######################################################"
echo "##################################################################################"
#package_update: true
#package_upgrade: true
#packages:
echo "##################################################################################"
echo "##### sudo yum upgrade python-pip jq bc git httpd6 php56-mysqlnd httpd ###########"
echo "##################################################################################"
sudo yum upgrade python-pip jq bc git httpd6 php56-mysqlnd httpd
echo "##################################################################################"
echo "##### copy keys ##################################################################"
echo "##################################################################################"
sudo cp /home/ec2-user/.ssh/ej_key_pair.pem /root/.ssh/ej_key_pair.pem
sudo chmod -v 400 /root/.ssh/*
echo "##################################################################################"
echo "##### sudo yum install -y gcc-c++ python-devel python-setuptools #################"
echo "##################################################################################"
sudo yum install -y gcc-c++ python-devel python-setuptools
echo "##################################################################################"
echo "##### sudo pip install --upgrade pip #############################################"
echo "##################################################################################"
sudo pip install --upgrade pip
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install pyserial ###################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install pyserial
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install PrettyTable ################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install PrettyTable
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install oauth ######################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install oauth
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install cheetah ####################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install cheetah
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install argparse ###################################"
echo "##################################################################################"
sudo /usr/local/bin/pip install argparse
echo "##################################################################################"
echo "##### sudo /usr/local/bin/pip install --ignore-installed airflow[s3,hive,python]##"
echo "##################################################################################"
sudo /usr/local/bin/pip install --ignore-installed airflow[s3,hive,python]
echo "##################################################################################"
echo "##### airflow initdb #############################################################"
echo "##################################################################################"
airflow initdb
echo "##################################################################################"
echo "##### nohup airflow webserver ####################################################"
echo "##################################################################################"
nohup airflow webserver &
