node default {
	include percona
}

class percona {

# include the percona yum repo
 $releasever = "6"
 $basearch = $hardwaremodel
	yumrepo { 
        "percona":
            descr       => "Percona",
            enabled     => 1,
            baseurl     => "http://repo.percona.com/centos/$releasever/os/$basearch/",
            gpgcheck    => 0;
	}

# include the packages needed for PXC
        package {
                "Percona-XtraDB-Cluster-server.$hardwaremodel":
                        alias => "MySQL-server",
                        require => [ Yumrepo['percona'], Package['MySQL-client'] ],
                        ensure => "installed";
                "Percona-XtraDB-Cluster-client.$hardwaremodel":
                        alias => "MySQL-client",
                        require => Yumrepo['percona'],
                        ensure => "installed";
                "rsync":
                        ensure => "present";

        }

}


## individual nodes

node node1 inherits default {

}

node node2 inherits default {

}

node node3 {

}

/*
node node3 inherits default {

}
*/


