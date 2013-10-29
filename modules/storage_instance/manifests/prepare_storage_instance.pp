class storage_instance::prepare_storage_instance {
    # prepage .bashrc
    file { "/home/node4/.bashrc2":
      ensure => "present",
      content => template("storage_instance/bashrc.erb"),
      owner  => "node4",
      group  => "node4",
      mode   => 644,
    }
}