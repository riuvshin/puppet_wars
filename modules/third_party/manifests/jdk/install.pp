class third_party::jdk::install {
    file { '/usr/local/jdk1.7.0_17':
        ensure => directory,
        mode => '755',
        owner => 'node4',
        group => 'node4',
    }

    file { "/usr/local/jdk1.7.0_17/":
        mode => "0644",
        owner => 'node4',
        group => 'node4',
        source => 'puppet:///modules/module_name/jdk.zip',
    }
}