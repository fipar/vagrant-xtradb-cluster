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
# include the my.cnf file

	file {
		"/etc/my.cnf":
			ensure => present,
			content => template("/tmp/vagrant-puppet/modules-0/percona/templates/my.cnf.erb"),
	}

# init the datadir
	exec { "/usr/bin/mysql_install_db --datadir /var/lib/mysql":
		creates => "/var/lib/mysql/mysql/user.MYD",
		logoutput => true,
		require => Package['MySQL-server'],
	} 

# start mysql
	exec { "/etc/init.d/mysql start": 
		logoutput => true,
		require => [ Package['MySQL-server'], Exec['/usr/bin/mysql_install_db --datadir /var/lib/mysql'] ]	
	}

}


## individual nodes

node node1 inherits default {

}

node node2 inherits default {

}

node node3 inherits default {

}


