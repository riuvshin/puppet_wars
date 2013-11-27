class all_in_one::install {
  # download aio zip
  file { "/home/$codenvy_user/aio-tomcat.zip":
    ensure => file,
    owner  => $codenvy_user,
    group => $codenvy_groups,
    mode   => "0755",
    source => "puppet:///file/cloud-ide-packaging-tomcat-codenvy-allinone-2.9.0.zip",
  }

}