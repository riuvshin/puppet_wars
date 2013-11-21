class all_in_one::prepare_aio_instance {
  include codenvy_user
  include third_party::jdk::install
  include third_party::maven::install
  include third_party::postfix::install
  include third_party::openldap_servers::install
  include third_party::git::install
  include all_in_one::configs
  #include all_in_one::install
  #include all_in_one::service
}