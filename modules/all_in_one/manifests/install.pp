class all_in_one::install {
  # download aio-tomcat
  wget::authfetch { "download-aio-tomcat":
    source_url       => "http://maven.codenvycorp.com/content/groups/codenvy-private-group/com/codenvy/cloud-ide/cloud-ide-packaging-tomcat-codenvy-allinone/2.8.2/cloud-ide-packaging-tomcat-codenvy-allinone-2.8.2.zip",
    target_directory => "/home/$codenvy_user/cloud-ide/",
    target_file      => "aio-tomcat.zip",
    username         => $codenvy_maven_username,
    password         => $codenvy_maven_password,
    require => [Class["codenvy_user"], Class["all_in_one::configs"]]
  } ->
  # extract aio-tomcat
  exec { "extract-aio-tomcat":
    cwd     => "/home/$codenvy_user/cloud-ide/",
    command => "unzip aio-tomcat.zip",
    creates => "/home/$codenvy_user/cloud-ide/bin"
  }
}