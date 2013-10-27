class createFile {

    file { "/home/node4/tryToCreateIt":
        ensure => "directory",
    }

    file { "/home/node4/tryToCreateIt/superConfigFile":
      ensure => "present",
      content => template("createFile/fileContent.erb"),
      owner  => "node4",
      group  => "node4",
      mode   => 644,
    }
}