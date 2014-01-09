#!/usr/bin/env bash

function set_repository {
  local ip=$1

  if [[ "$ip" =~ ^[0-9]{1,3}\.250\.[0-9]{1,3}\.[0-9]{1,3}$ ]] ; then     
    echo "echo \"http://mol-hsk-mps.andweb.dmgt.net\" > /opt/local/etc/pkgin/repositories.conf"
  else    
    echo "echo \"http://mol-hsk-mps.andintweb.dmgt.net\" > /opt/local/etc/pkgin/repositories.conf"
  fi
}

function install_packages {
  echo "pkgin -yf update && pkgin in MOLsunjava-1.7.17" 
}

instances=( 10.250.76.187 10.250.76.188 10.250.76.189 10.250.76.190 )
for instance in "${instances[@]}"
do  
  ssh -T -q "root@$instance" "$(set_repository $instance) && $(install_packages)"

  echo "Setting up exhibitor and zookeper on $instance"

  ssh -q root@$instance 'bash -s' < ./uninstall.sh
  ssh -q root@$instance 'bash -s' < ./install.sh
  
  echo "Copying files to $instance"
  scp exhibitor.xml root@$instance:/opt/molsfw/exhibitor/
  scp exhibitor-1.5.1.jar root@$instance:/opt/molsfw/exhibitor/    
  scp exhibitor.properties root@$instance:/opt/molsfw/zooman/exhibitor.properties

  ssh -q root@$instance 'bash -s' < ./ensure-permissions.sh

  echo "Starting exhibitor on $instance"
  ssh -q root@$instance 'svccfg delete -f exhibitor'  
  ssh -q root@$instance 'svccfg import /opt/molsfw/exhibitor/exhibitor.xml && svcadm enable exhibitor'  
  scp zoo.cfg root@$instance:/opt/molsfw/zookeeper/zookeeper-3.4.5/conf/
done