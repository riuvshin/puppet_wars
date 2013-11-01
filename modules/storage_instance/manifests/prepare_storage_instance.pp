class storage_instance::prepare_storage_instance {
  # prepage .bashrc
  file { "/root/.bashrc":
    ensure  => "present",
    content => template("storage_instance/storage_instance_bashrc.erb"),
    owner   => "root",
    group   => "root",
    mode    => 644,
  }
  include third_party::jdk::install
}