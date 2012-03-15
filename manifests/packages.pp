class limits::packages {

  package { ['augeas', 'augeas-libs', 'ruby-augeas']:
    ensure => present,
  }

}
