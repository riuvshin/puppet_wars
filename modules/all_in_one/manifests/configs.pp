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
  
  exec {"get_ip":
    command => "$ip = ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
  }
  
  notify { "$ip":
    require => [Exec["get_ip"]]
  }
  
}