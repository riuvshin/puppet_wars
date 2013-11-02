import "nodes/*.pp"

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }





# CODENVY_USER
$codenvy_user = "cl-server"
$codenvy_groups = ["cl-server"]

#DOWNLOAD URLS
$jdk_url = "http://yum.codenvy-dev.com/archives/jdk-7u17-linux-x64.tar.gz"

#CREDENTIALS FOR DOWNLOADS
$username_for_downloads = "protect"
$pass_for_downloads = "protect"