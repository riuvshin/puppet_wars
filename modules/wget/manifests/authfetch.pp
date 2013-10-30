################################################################################
#
# This class will download files from the internet.
# Username must be provided. And the user's password must be stored in the password variable within the .wgetrc file.
#
# You may define a web proxy using $::http_proxy if necessary.
#
# _Source_ : https://github.com/maestrodev/puppet-wget
#
# == Parameters
#
# [+source_url+]
#        The full url to download the resource
#
# [+target_directory+]
#        The directory which will contains the downloaded resource
#
# [+target_file+]
#        The file name for the downloaded resource
#
# [+timeout+]
#         The maximum time the download should take. If the command takes longer than the timeout, the download is considered to
#         have failed.
#         The time is specified in seconds. (default: 0 which mean no timeout)
#
# [+username+]
#   The username to use to download the resource
#
# [+password+]
#   The password to use to download the resource
#
# == Examples
#
# Download a web page :
#
#   wget::fetch { "download":
#       source_url          => "http://www.google.fr",
#       target_directory    => "/home/download",
#       target_file         => "index.html",
#       username            => "mac",
#       password            => "OSX",
#   }
#
################################################################################
define wget::authfetch ($source_url, $target_directory, $target_file, $timeout = "0", $username, $password = "") {
  # using "unless" with /usr/bin/test instead of "creates" to re-attempt download on empty files.
  # wget creates an empty file when a download fails, and then it wouldn't try again to download the file
  if $::http_proxy {
    $environment = ["HTTP_PROXY=$::http_proxy", "http_proxy=$::http_proxy", "WGETRC=/tmp/wgetrc-${name}"]
  } else {
    $environment = ["WGETRC=/tmp/wgetrc-${name}"]
  }

  file { "/tmp/wgetrc-${name}":
    owner   => root,
    mode    => 600,
    content => "password=${password}",
  } ->
  exec { "wget-$name":
    command     => "/usr/bin/wget --user=${username} --output-document=${target_directory}/${target_file} $source_url",
    cwd         => $target_directory,
    timeout     => $timeout,
    unless      => "/usr/bin/test -s ${target_directory}/${target_file}",
    environment => $environment,
  }
}