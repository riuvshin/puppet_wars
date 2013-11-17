class all_in_one::prepare_aio_instance {
  include third_party::jdk::install
  include third_party::maven::install
  include third_party::postfix::install
  include all_in_one::configs
}