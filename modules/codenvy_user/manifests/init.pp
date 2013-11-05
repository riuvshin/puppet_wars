class codenvy_user {
  group { $codenvy_groups:
    ensure => "present",
    gid    => "5001"
  }

  user { $codenvy_user:
    ensure     => "present",
    home       => "/home/$codenvy_user",
    shell      => "/bin/bash",
    managehome => true,
    password   => "UQKm4Lo8xfnKs", # CodenvySuperSecret123321
    groups     => $codenvy_groups,
    uid        => "5001",
    gid        => "5001",
    require => Group["$codenvy_groups"]
  }

  file { "/home/$codenvy_user/.ssh":
    ensure => directory,
    mode   => 700,
    owner  => $codenvy_user,
    group  => $codenvy_groups,
    require => User["$codenvy_user"]
  }
}