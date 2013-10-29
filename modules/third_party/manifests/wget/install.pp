################################################################################
# Class: wget
#
# This class will install wget.
#
################################################################################
class third_party::wget::install {
  package {'wget':
    ensure => latest }
    
    notify {"Message from elsewhere: ":}
}