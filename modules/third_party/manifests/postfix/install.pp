class third_party::postfix::install {
  package { "postfix": ensure => "installed", }

  service { "postfix":
    ensure  => running,
    enable  => true,
    require => [Package["postfix"]]
  }

}