class storage_instance::prepare_storage_instance {
  include codenvy_user
  # prepage .bashrc
  file { "/home/cl-server/.bashrc":
    ensure  => "present",
    content => template("storage_instance/storage_instance_bashrc.erb"),
    owner   => "cl-server",
    group   => "cl-server",
    mode    => 644,
  }
  include third_party::jdk::install
}