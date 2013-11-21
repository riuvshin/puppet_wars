class all_in_one::service {
  service { "codenvy-aio":
    ensure     => stopped,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  } ->
  exec {"extract":
    
  } ->
  service { "codenvy-aio":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
  
}