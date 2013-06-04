#!/bin/bash
# Tries to follow the instructions found at http://www.percona.com/doc/percona-xtradb-cluster/manual/bootstrap.html

for i in 1 2 3; do
echo "sudo service mysql stop" | vagrant ssh node$i	
done 
