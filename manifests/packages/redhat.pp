class limits::packages::redhat {

  case $::os[release][major] {
    '8': {
      $repo_require = Dnf::Module['ruby']
      ensure_resource('dnf::module','ruby',{'ensure'=>'present','stream'=>'2.5'})
    }
    default: {
      $repo_require = Yumrepo['os']
      Cegeka_yum::Repo <| title == 'os' |>
    }
  }

  package { ['augeas', 'augeas-libs', 'ruby-augeas'] :
    ensure  => present,
    require => $repo_require
  }

}
