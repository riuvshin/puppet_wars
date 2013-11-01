class third_party::jdk::install {
  include wget::install

  $installRootDir = "/usr/local"
  $fileName = "jdk-7u17-linux-x64.tar.gz"
  $url = "http://yum.codenvy-dev.com/archives/jdk-7u17-linux-x64.tar.gz"

  exec {"init_download":
    cwd => "$installRootDir",
    onlyif => "test ! -f $installRootDir/$fileName"
  } ->
  # download jdk
  wget::authfetch { "download-java-installer":
    source_url       => "$url",
    target_directory => "$installRootDir",
    target_file      => "$fileName",
    username         => "protect",
    password         => "protect"
  } ->
  # extract jdk
  exec { "extract_jdk":
    cwd     => "$installRootDir",
    command => "/bin/tar -xvf $fileName",
    #onlyif => "test ! -d $installRootDir/jdk1.7.0_17"
  }
}