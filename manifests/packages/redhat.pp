class limits::packages::redhat {

  package { ['augeas', 'augeas-libs', 'ruby-augeas'] :
    ensure => present,
  }

}
