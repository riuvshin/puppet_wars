class storage-instance::prepare-storage-instance {
    # prepage .bashrc
    file { "/home/node4/.bashrc2":
      ensure => "present",
      content => template("storage-instance/.bashrc.erb"),
      owner  => "node4",
      group  => "node4",
      mode   => 644,
    }
}