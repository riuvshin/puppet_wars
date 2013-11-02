class git_instance::prepare_git_instance {
  # prepage .bashrc
  file { "/home/$codenvy_user/.bashrc":
    ensure  => "present",
    content => template("git_instance/git_instance_bashrc.erb"),
    owner   => $codenvy_user,
    group   => $codenvy_user,
    mode    => 644,
  }
}