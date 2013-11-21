class third_party::openldap_servers::config {
  File {
    require => Class["third_party::openldap_servers::install"],
    notify  => Class["third_party::openldap_servers::service"],
    ensure  => "present",
    owner   => root,
    group   => root,
    mode    => 644,
  }

  file {
    "/etc/openldap/schema/codenvy.schema":
      content => template("all_in_one/codenvy.schema.erb");

    "/etc/openldap/slapd.conf":
      content => template("all_in_one/slapd.conf.erb");

    "/etc/openldap/initial.ldif":
      content => template("all_in_one/initial.ldif.erb");
  } ->
  exec { "rename_folder":
    cwd     => "/etc",
    command => "mv -f /etc/openldap/slapd.d /etc/openldap/slapd.d-",
    creates => "/etc/openldap/slapd.d-"
  } ->
  exec { "ldap_init":
    command => "slapadd < /etc/openldap/initial.ldif && date > /etc/openldap/success.txt",
    creates => "/etc/openldap/success.txt"
  } ->
  file { "/var/lib/ldap/":
    ensure => "present",
    owner  => ldap,
    group  => ldap,
    mode   => 644,
  }
}