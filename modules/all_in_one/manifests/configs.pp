class all_in_one::configs {
  $config_dirs = [
    "/home/$codenvy_user/cloud-ide/",
    "/home/$codenvy_user/cl-data/",
    "/home/$codenvy_user/cl-data/logs",
    "/home/$codenvy_user/cl-data/gluster",
    "/home/$codenvy_user/cl-data/cloud-ide-local-configuration",
    "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/admin-conf"]

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

  # creating folders
  file { $config_dirs:
    ensure  => "directory",
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 775,
    require => Class["codenvy_user"]
  }

  # creating .bashrc
  file { "/home/$codenvy_user/.bashrc":
    ensure  => "present",
    content => template("all_in_one/bashrc.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => Class["codenvy_user"]
  }

  # creating github_client_secrets.json
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/github_client_secrets.json":
    ensure  => "present",
    content => template("all_in_one/github_client_secrets.json.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating google_client_secrets.json
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/google_client_secrets.json":
    ensure  => "present",
    content => template("all_in_one/google_client_secrets.json.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating wso2_client_secrets.json
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/wso2_client_secrets.json":
    ensure  => "present",
    content => template("all_in_one/wso2_client_secrets.json.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating admin.properties
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/admin-conf/admin.properties":
    ensure  => "present",
    content => template("all_in_one/admin.properties.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating email-connection.properties
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/email-connection.properties":
    ensure  => "present",
    content => template("all_in_one/email-connection.properties.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating user-db-ldap-connection.properties
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/user-db-ldap-connection.properties":
    ensure  => "present",
    content => template("all_in_one/user-db-ldap-connection.properties.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating cloud-ide-env-specific-configuration.xml
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/cloud-ide-env-specific-configuration.xml":
    ensure  => "present",
    content => template("all_in_one/cloud-ide-env-specific-configuration.xml.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # creating logback-additional-appenders.xml
  file { "/home/$codenvy_user/cl-data/cloud-ide-local-configuration/logback-additional-appenders.xml":
    ensure  => "present",
    content => template("all_in_one/logback-additional-appenders.xml.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
    require => [Class["codenvy_user"], File[$config_dirs]]
  }

  # prepare aio tomcat service
  file { "/etc/init.d/codenvy-aio":
    ensure  => "present",
    content => template("all_in_one/codenvy-aio.erb"),
    mode    => 775,
    owner   => "root",
    group   => "root",
  }

}