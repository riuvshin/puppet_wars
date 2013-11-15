
node "puppet-node1.codenvy-stg.com" {
  $aio_host_url = "puppet-node1.codenvy-stg.com"
  $aio_runner_url = "http://api.apprun.codenvy-stg.com"
  $aio_runner_uname = "support@codenvy.com"
  $aio_runner_pass = ""
  $aio_github_client_id = "c92ca26f91c6eb9234a3"
  $aio_github_secret = "86a73821812ab9955b180a0478501640d1233f1c"
  $aio_google_client_id = "1014492467101.apps.googleusercontent.com"
  $aio_google_secret = "HiH-b6CH5gG7wwjr797NDROR"
  $aio_wso2_client_id = "FAKE"
  $aio_wso2_secret = "FAKE"
  include all_in_one::prepare_aio_instance
}

node "aio.codenvy.com" {
  $aio_host_url = "aio.codenvy.com"
  $aio_runner_url = "http://api.apprun.codenvy-stg.com"
  $aio_runner_uname = "support@codenvy.com"
  $aio_runner_pass = ""
  $aio_github_client_id = "c92ca26f91c6eb9234a3"
  $aio_github_secret = "86a73821812ab9955b180a0478501640d1233f1c"
  $aio_google_client_id = "1014492467101.apps.googleusercontent.com"
  $aio_google_secret = "HiH-b6CH5gG7wwjr797NDROR"
  $aio_wso2_client_id = "FAKE2"
  $aio_wso2_secret = "FAKE2"
  include all_in_one::prepare_aio_instance
}