- Note

Just a bunch of files - Not garanteed to work if executed. 
Mainly kept in git to avoid forgetting a couple bash tricks. 

ZK log is in : tail -f  /opt/molsfw/zookeeper/zookeeper-3.4.5/zookeeper.out

ZK conf will be generated in: /opt/molsfw/zookeeper/zookeeper-3.4.5/bin/../conf/zoo.cfg 
'dont edit! exhibitor will do it for you'

- run ./cluster-install.sh 
- *start by clicking restart each of the ZK instances from the Web UI of Exhibitor 
- change on ONLY ONE server the config for the cluster to 1:10.250.76.187,2:10.250.76.188,3:10.250.76.189,4:10.250.76.190 commit to ALL 

Check and it should be all green on all 3 servers. 

Feel free to change exhibitor.properties but don't add the cluster ids:ips there just yet, it has to be done via Web UI with a commit all command!
