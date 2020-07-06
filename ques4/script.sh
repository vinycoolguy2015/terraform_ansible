#! /bin/bash

#yum install -y mysql git awscli jq
yum install -y git awscli jq

#mysql -u root -pTest1086# -h application-rds.chynuosgviuy.us-east-1.rds.amazonaws.com -e "create database test;use test;CREATE TABLE users (id int(11) NOT NULL auto_increment,name varchar(100) NOT NULL,age int(3) NOT NULL,email varchar(100) NOT NULL,PRIMARY KEY (id));"

yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
yum install -y nodejs

#git clone https://github.com/chapagain/nodejs-mysql-crud
git https://github.com/vinycoolguy2015/nodejs-mysql-crud.git
rds_hostname=`aws rds describe-db-instances --region us-east-1 |jq [.DBInstances[0].Endpoint.Address][0]| tr -d '"'`
#rds_status=`aws rds describe-db-instances --region us-east-1 |jq [.DBInstances[0].DBInstanceStatus][0]| tr -d '"'`
if [ $rds_hostname == "null" ]; then  sleep 5m;fi
rds_hostname=`aws rds describe-db-instances --region us-east-1 |jq [.DBInstances[0].Endpoint.Address][0]| tr -d '"'`

cd nodejs-mysql-crud
sed -i "s/localhost/$rds_hostname/g" config.js
node app.js

