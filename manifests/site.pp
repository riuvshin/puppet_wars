import "nodes/*.pp"

include wget::install
include third_party::unzip::install

# GLOBAL DEFINITIONS
Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

# CODENVY_USER
$codenvy_user = "cl-server"
$codenvy_groups = ["cl-server"]

# DOWNLOAD URLS
# THIRD PARTY
$jdk_url = "http://yum.codenvy-dev.com/archives/jdk-7u17-linux-x64.tar.gz"
# CODENVY
$codeassistant_tomcat_url = "http://maven.codenvycorp.com/content/groups/codenvy-private-group/com/codenvy/cloud-ide/cloud-ide-packaging-tomcat-codeassistant/2.8.0/cloud-ide-packaging-tomcat-codeassistant-2.8.0.zip"

# CREDENTIALS FOR DOWNLOADS
# THIRD PARTY
$username_for_downloads = "protect"
$pass_for_downloads = "protect"
# CODENVY
$codenvy_maven_username = "riuvshin"
$codenvy_maven_password = ""