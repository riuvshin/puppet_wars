class all_in_one::configs {
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
    hasstatus  => true,
    hasrestart => true,
    subscribe  => File["/etc/sysconfig/iptables"]
  }

  package { "postfix": ensure => "installed", }

  package { "cloud-ide-packaging-tomcat-codenvy-allinone-rpm":
    ensure  => "latest",
    require => [
      File["/etc/codenvy.conf"],
      File["/etc/yum.repos.d/Codenvy.repo"],
      File["/etc/sysconfig/iptables"],
      Class["third_party::jdk::install"],
      Class["third_party::maven::install"],
      Package["postfix"]],
  }

}
