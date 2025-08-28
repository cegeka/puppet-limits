# class limits::packages::redhat
#
class limits::packages::redhat {

  package { ['augeas', 'augeas-libs'] :
    ensure => present,
  }

}
