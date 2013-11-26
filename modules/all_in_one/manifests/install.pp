class all_in_one::install {
  class { 'nexus':
    url      => $nexus_url,
    username => $codenvy_maven_username,
    password => $codenvy_maven_password
  }

  nexus::artifact { 'codenvy aio tomcat':
    gav        => "com.codenvy.cloud-ide:cloud-ide-packaging-tomcat-codenvy-allinone:2.10.0-SNAPSHOT",
    packaging  => 'zip',
    repository => "codenvy-private-group",
    output     => "/home/$codenvy_user/aio_super_test.zip",
    timeout    => 3600,
    owner      => $codenvy_user,
    group      => $codenvy_groups,
    mode       => 0755
  }

}