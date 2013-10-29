class third_party::jdk::install {
  
  include third_party::wget::install

    file { "/usr/local/jdk1.7.0_17":
        ensure => "directory",
        mode => "744",
        owner => "root",
        group => "root",
    }
    
   wget::fetch {"download jdk":
       source => "http://docs.puppetlabs.com/learning/definedtypes.html",
       destination => "/usr/local/jdk1.7.0_17"
      }
      
   file { "/usr/local/jdk1.7.0_17/jdk-7u17-linux-x64.tar.gz":
    ensure => present,
    mode   => 755,
  }
}