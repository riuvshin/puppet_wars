class storage_instance::prepare_storage_instance {
  include codenvy_user
  include third_party::jdk::install

  $codeassistant_directory = "/home/$codenvy_user/codeassistant"
  $codeassistant_file_name = "tomcat-codeassistant.zip"

  # prepage .bashrc
  file { "/home/$codenvy_user/.bashrc":
    ensure  => "present",
    content => template("storage_instance/storage_instance_bashrc.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
  }

  # create codeassistant directory
  file { $codeassistant_directory:
    ensure => directory,
    mode   => 775,
    owner  => $codenvy_user,
    group  => $codenvy_groups,
  }

  # download codeassistant tomcat
  wget::authfetch { "download-codeassistant-tomcat":
    source_url       => $codeassistant_tomcat_url,
    target_directory => $codeassistant_directory,
    target_file      => $codeassistant_file_name,
    username         => $codenvy_maven_username,
    password         => $codenvy_maven_password
  } ->
  # extract codeassistant tomcat
  exec { "extract-codeassistant-tomcat":
    cwd     => $codeassistant_directory,
    command => "unzip $codeassistant_file_name",
    user    => $codenvy_user,
    onlyif  => "test ! -d $codeassistant_directory/bin"
  } ->
  # prepare codeassistant tomcat service
  file { "/etc/init.d/codenvy-storage":
    ensure  => "present",
    content => template("storage_instance/codenvy-storage.erb"),
    mode    => 775,
    owner   => "root",
    group   => "root"
  } ->
  # adding codeassistant tomcat as service
  exec { "register-codeassistant-tomcat-service":
    command => "chkconfig --add codenvy-storage",
    unless  => "chkconfig --list &> /dev/stdout | grep \"codenvy-storage\"",
    cwd     => '/etc/init.d',
    require => File["/etc/init.d/codenvy-storage"],
    user    => root;
  }
  #
}