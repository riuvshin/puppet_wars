class third_party::openldap_servers::install {
  include third_party::openldap_servers::package, third_party::openldap_servers::config, third_party::openldap_servers::service
}