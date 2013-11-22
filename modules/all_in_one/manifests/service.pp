class all_in_one::service {
  service { "codenvy-aio":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [
      Class["codenvy_user"],
      Class["third_party::jdk::install"],
      Class["third_party::maven::install"],
      Class["third_party::postfix::install"],
      Class["third_party::openldap_servers::install"],
      Class["third_party::git::install"],
      Class["all_in_one::configs"],
      Class["all_in_one::install"]]
  }
}