node "common_aio" {
  include all_in_one::prepare_aio_instance

  $aio_host_url = "your.host.name"
  $aio_runner_url = "http://your_runner_host"
  $aio_runner_uname = "your_runner_login"
  $aio_runner_pass = "your_login_passwd"
  $aio_github_client_id = "your.github.id"
  $aio_github_secret = "your.github.id.secret"
  $aio_google_client_id = "your.google.id"
  $aio_google_secret = "your.google.id.secret"
  $aio_wso2_client_id = "your.wso2.id"
  $aio_wso2_secret = "your.wso2.id.secret"
}

node "puppet-node1.codenvy-stg.com" inherits "common_aio" {
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
}

node "aio.codenvy.com" inherits "common_aio" {
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
}