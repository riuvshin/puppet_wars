class codenvy_user {
  user { 'cl-server':
    ensure     => 'present',
    home       => '/home/cl-server',
    shell      => '/bin/bash',
    managehome => true,
    password   => "UQKm4Lo8xfnKs", #CodenvySuperSecret123321
    groups     => ['cl-server'],
  }

  file { "/home/cl-server/.ssh":
    ensure => directory,
    mode   => 700,
    owner  => "cl-server",
    group  => "cl-server",
  }
}