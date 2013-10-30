class git_instance::prepare_git_instance {
  # prepage .bashrc
  file { "/home/node4/.bashrc":
    ensure  => "present",
    content => template("git_instance/git_instance_bashrc.erb"),
    owner   => "node4",
    group   => "node4",
    mode    => 644,
  }
}