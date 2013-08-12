#!/bin/bash
# shuts down mysqld on the three nodes 

for i in 1 2 3; do
echo "sudo service mysql stop" | vagrant ssh pxc_node$i	
done 
