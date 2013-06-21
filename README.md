vagrant-xtradb-cluster
======================

Vagrant environment for testing Percona XtraDB Cluster


requirements
===
- vagrant
- virtualbox

setup
===

  ./run_me_first.sh 
  # that runs vagrant up and then bootstrap.sh
  # you can reset everything with reinit.sh, and manually bootstrap the cluster with boostrap.sh later, if needed. 

usage
===

You can connect to <nodename> like so: 
  vagrant ssh <nodename>

And then run the mysql CLI as you would normally
 
