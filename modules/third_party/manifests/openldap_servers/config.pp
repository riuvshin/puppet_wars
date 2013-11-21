class third_party::openldap_servers::config {
  File {
    require => Class["third_party::openldap_servers::package"],
    notify  => Class["third_party::openldap_servers::service"],
    ensure  => "present",
    owner   => root,
    group   => root,
    mode    => 644,
  }

  file {
    "/etc/openldap/schema/codenvy.schema":
      content => template("third_party/openldap_servers/codenvy.schema.erb");

    "/etc/openldap/slapd.conf":
      content => template("third_party/openldap_servers/slapd.conf.erb");

    "/etc/openldap/initial.ldif":
      content => template("third_party/openldap_servers/initial.ldif.erb");
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
    ensure  => "present",
    owner   => ldap,
    group   => ldap,
    mode    => 644,
    recurse => true,
  }
}