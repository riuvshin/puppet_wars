class storage_instance::prepare_storage_instance {
  # prepage .bashrc
  file { "/home/node4/.bashrc":
    ensure  => "present",
    content => template("storage_instance/storage_instance_bashrc.erb"),
    owner   => "node4",
    group   => "node4",
    mode    => 644,
  }
  
  include third_party::git::install
  include third_party::jdk::install
}