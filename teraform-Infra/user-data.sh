#!/bin/bash -e

echo "This is the user data of instance"

apt-get install git

apt-add-repository ppa:ansible/ansible

apt update -y 

apt install -y git ansible unzip

cat << EOF >> /etc/environment

EOF

cd /tmp/
git clone https://${gh_username}:${gh_token}@github.com/jayantverma11/cloud-infra.git

ansible-playbook /tmp/cloud-infra/ansible/main.yml
