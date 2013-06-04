#!/bin/bash
# Tries to follow the instructions found at http://www.percona.com/doc/percona-xtradb-cluster/manual/bootstrap.html
# assumes mysql is not running on any node. this will only work right after the first time you do vagrant up to boot up the nodes, or
# after you run the reinit script

# bootstrap node1
echo "sudo /etc/init.d/mysql start --wsrep-cluster-address='gcomm://'" | vagrant ssh node1


# start the remaining nodes again 
for i in 2 3; do
echo "sudo service mysql start" | vagrant ssh node$i
done 

