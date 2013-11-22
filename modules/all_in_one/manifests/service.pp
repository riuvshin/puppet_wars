class all_in_one::service {
  service { "codenvy-aio":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [Class["codenvy_user"], Class["all_in_one::configs"], Class["all_in_one::install"]]
  }
}