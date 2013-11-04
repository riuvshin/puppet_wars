class storage_instance::prepare_storage_instance {
  include codenvy_user
  include third_party::jdk::install
  include storage_instance::configs
}