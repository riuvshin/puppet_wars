class allInOne::prepare_aio_instance {
  include third_party::jdk::install
  include third_party::maven::install
  include allInOne::configs
}