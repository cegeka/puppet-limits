class limits::packages::debian {

  package { ['libaugeas0', 'augeas-lenses', 'libaugeas-ruby'] :
    ensure => present,
  }

}
