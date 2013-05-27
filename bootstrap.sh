#!/bin/bash
# Tries to follow the instructions found at http://www.percona.com/doc/percona-xtradb-cluster/manual/bootstrap.html

for i in 2 3 1; do
	cat <<EOF | vagrant ssh node$i
sudo sed 's/wsrep_cluster_address=.*/wsrep_cluster_address=gcomm:\/\/192.168.70.2,192.168.70.3,192.168.70.4/g' -i /etc/my.cnf
sudo service mysql restart
EOF
	
done 
