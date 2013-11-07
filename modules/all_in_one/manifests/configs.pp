class all_in_one::configs {
  $ip = ""

  ##############################################################
  # Creating codenvy.conf
  ##############################################################
  file { "/etc/codenvy.conf":
    ensure  => "present",
    content => template("all_in_one/codenvy.conf.erb"),
    owner   => root,
    group   => root,
    mode    => 644,
  }

  # add codenvy repo
  file { "/etc/yum.repos.d/Codenvy.repo":
    ensure  => "present",
    content => template("all_in_one/codenvy.repo.erb"),
    owner   => root,
    group   => root,
    mode    => 644,
  }

  # changing iptables
  file { "/etc/sysconfig/iptables":
    ensure  => "present",
    content => template("all_in_one/iptables.erb"),
    owner   => root,
    group   => root,
    mode    => 600,
  }

  service { "iptables":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => File["/etc/sysconfig/iptables"]
  }

}
