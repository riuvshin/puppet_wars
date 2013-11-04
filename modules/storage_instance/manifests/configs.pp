class storage_instance::configs {
  $codeassistant_directory = "/home/$codenvy_user/codeassistant"
  $codeassistant_file_name = "tomcat-codeassistant.zip"
  $data_dir = "/home/$codenvy_user/data"

  ##############################################################
  # Creating .bashrc
  ##############################################################
  file { "/home/$codenvy_user/.bashrc":
    ensure  => "present",
    content => template("storage_instance/storage_instance_bashrc.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
  }

  ##############################################################
  # Creating folders and preparing configs
  ##############################################################
  file { $codeassistant_directory:
    ensure => directory,
    mode   => 775,
    owner  => $codenvy_user,
    group  => $codenvy_groups,
  }

  file { $data_dir:
    ensure => directory,
    mode   => 775,
    owner  => $codenvy_user,
    group  => $codenvy_groups,
  }

  file { "$data_dir/conf":
    ensure  => directory,
    mode    => 775,
    owner   => $codenvy_user,
    group   => $codenvy_groups,
    require => File["$data_dir"]
  }

  file { "$data_dir/logs":
    ensure  => directory,
    mode    => 775,
    owner   => $codenvy_user,
    group   => $codenvy_groups,
    require => File["$data_dir"]
  }

  file { "$data_dir/conf/logback-additional-appenders.xml":
    ensure  => "present",
    content => template("storage_instance/logback-additional-appenders.xml.erb"),
    mode    => 664,
    owner   => $codenvy_user,
    group   => $codenvy_groups,
    require => File["$data_dir", "$data_dir/conf"]
  }

  exec { "move-indexes-to-data-dir":
    cwd     => $codeassistant_directory,
    command => "mv $codeassistant_directory/ide-codeassistant-lucene-index $data_dir/index",
    user    => $codenvy_user,
    creates => "$data_dir/index"
  }

  ##############################################################
  # Downloading codeassistant tomcat and installing as service
  ##############################################################

  # download codeassistant tomcat
  wget::authfetch { "download-codeassistant-tomcat":
    source_url       => $codeassistant_tomcat_url,
    target_directory => $codeassistant_directory,
    target_file      => $codeassistant_file_name,
    username         => $codenvy_maven_username,
    password         => $codenvy_maven_password
  }

  # extract codeassistant tomcat
  exec { "extract-codeassistant-tomcat":
    cwd     => $codeassistant_directory,
    command => "unzip $codeassistant_file_name",
    user    => $codenvy_user,
    onlyif  => "test ! -d $codeassistant_directory/bin"
  }

  # prepare codeassistant tomcat service
  file { "/etc/init.d/codenvy-storage":
    ensure  => "present",
    content => template("storage_instance/codenvy-storage.erb"),
    mode    => 775,
    owner   => "root",
    group   => "root",
    require => File["$codeassistant_directory/bin", "/etc/init.d"]
  }

  # adding codeassistant tomcat as service
  exec { "register-codeassistant-tomcat-service":
    command => "chkconfig --add codenvy-storage",
    unless  => "chkconfig --list &> /dev/stdout | grep \"codenvy-storage\"",
    cwd     => '/etc/init.d',
    require => File["/etc/init.d/codenvy-storage"],
    user    => root;
  }

  # System Service
  service { "codenvy-storage":
    ensure  => running,
    enable  => true,
    name    => "codenvy-storage",
    require => File["/etc/init.d/codenvy-storage", "$codeassistant_directory/bin/catalina.sh"],
  }

}