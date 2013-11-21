class all_in_one::configs {
  $config_dirs = [
    "/home/$codenvy_user/cloud-ide/",
    "/home/$codenvy_user/cl-data/logs",
    "/home/$codenvy_user/cl-data/cloud-ide-local-configuration",
    "/home/$codenvy_user/cl-data/gluster"]

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

}