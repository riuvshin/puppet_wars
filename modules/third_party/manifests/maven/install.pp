class third_party::maven::install {
  $installRootDir = "/usr/local"
  $fileName = "apache-maven-3.0.4-bin.tar.gz"
  $url = $maven_url

  # download maven
  wget::authfetch { "download-maven":
    source_url       => "$url",
    target_directory => "$installRootDir",
    target_file      => "$fileName",
    username         => $username_for_downloads,
    password         => $pass_for_downloads
  } ->
  # extract maven
  exec { "extract_maven":
    cwd     => "$installRootDir",
    command => "tar -xvf $fileName",
    onlyif  => "test ! -d $installRootDir/apache-maven-3.0.4"
  }
}