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


# fetch myq_status

       exec { "/usr/bin/wget https://github.com/jayjanssen/myq_gadgets/raw/master/MySQL_Script_Utils.pm -O /usr/local/bin/MySQL_Script_Utils.pm && /usr/bin/wget https://raw.github.com/jayjanssen/myq_gadgets/master/myq_status -O /usr/local/bin/myq_status && chmod 777 /usr/local/bin/myq_status":
		logoutput => true
	}

# start mysql
#	exec { "/etc/init.d/mysql start": 
#		logoutput => true,
#		require => [ Package['MySQL-server'], Exec['/usr/bin/mysql_install_db --datadir /var/lib/mysql'] ]	
#	}


# stop iptables 
	exec { "/etc/init.d/iptables stop":
		logoutput => true,
	}
}
## individual nodes

node pxc inherits default {
# start mysql in bootstrap mode
	exec { "/etc/init.d/mysql bootstrap-pxc":
		logoutput => true,
	}
}

node pxc_node2 inherits default {
# start mysql 
	 exec { "/etc/init.d/mysql start": 
		logoutput => true,
	}
}

node pxc_node3 inherits default {
# start mysql
	exec { "/etc/init.d/mysql start":
		logoutput => true,
	}
}


