node "node-5.codenvy.com" {
    include third_party::git::install
    include storage_instance::prepare_storage_instance
    include third_party::jdk::install
}
