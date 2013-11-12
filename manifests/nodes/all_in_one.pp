class common_aio {  
  ##############################################################
  # Creating codenvy.conf
  ##############################################################
  file { "/etc/codenvy.conf":
    ensure  => "present",
    content => template("all_in_one/codenvy.conf.erb"),
    owner   => root,
    group   => root,
    mode    => 644,
  }

 include all_in_one::prepare_aio_instance
}

node "puppet-node1.codenvy-stg.com" {
  $aio_host_url = "puppet-node1.codenvy-stg.com"
  $aio_runner_url = "http://api.apprun.codenvy-stg.com"
  $aio_runner_uname = "support@codenvy.com"
  $aio_runner_pass = "eXoAdmin12321"
  $aio_github_client_id = "c92ca26f91c6eb9234a3"
  $aio_github_secret = "86a73821812ab9955b180a0478501640d1233f1c"
  $aio_google_client_id = "1014492467101.apps.googleusercontent.com"
  $aio_google_secret = "HiH-b6CH5gG7wwjr797NDROR"
  $aio_wso2_client_id = "FAKE"
  $aio_wso2_secret = "FAKE"
  include common_aio
}

node "aio.codenvy.com" {
  $aio_host_url = "puppet-node1.codenvy-stg.com"
  $aio_runner_url = "http://api.apprun.codenvy-stg.com"
  $aio_runner_uname = "support@codenvy.com"
  $aio_runner_pass = "eXoAdmin12321"
  $aio_github_client_id = "c92ca26f91c6eb9234a3"
  $aio_github_secret = "86a73821812ab9955b180a0478501640d1233f1c"
  $aio_google_client_id = "1014492467101.apps.googleusercontent.com"
  $aio_google_secret = "HiH-b6CH5gG7wwjr797NDROR"
  $aio_wso2_client_id = "TEST"
  $aio_wso2_secret = "TEST"
  include common_aio
}


