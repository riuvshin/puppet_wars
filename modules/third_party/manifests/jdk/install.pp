class third_party::jdk::install {
  
  $installRootDir = "/usr/local"
  $fileName = "jdk.tar.gz"
  $url = $jdk_url

  # download jdk
  wget::authfetch { "download-jdk":
    source_url       => "$url",
    target_directory => "$installRootDir",
    target_file      => "$fileName",
    username         => $username_for_downloads,
    password         => $pass_for_downloads 
  } ->
  # extract jdk
  exec { "extract_jdk":
    cwd     => "$installRootDir",
    command => "tar -xvf $fileName",
    onlyif => "test ! -d $installRootDir/jdk1.7.0_17"
  }
}