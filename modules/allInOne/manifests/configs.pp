class allInOne::configs {
  ##############################################################
  # Creating codenvy.conf
  ##############################################################
  file { "/etc/codenvy.conf":
    ensure  => "present",
    content => template("allInOne/codenvy.conf.erb"),
    owner   => root,
    group   => root,
    mode    => 644,
  }
}