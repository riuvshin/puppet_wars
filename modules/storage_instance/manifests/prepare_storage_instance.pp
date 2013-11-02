class storage_instance::prepare_storage_instance {
  include codenvy_user
  # prepage .bashrc
  file { "/home/$codenvy_user/.bashrc":
    ensure  => "present",
    content => template("storage_instance/storage_instance_bashrc.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
  }
  include third_party::jdk::install
}