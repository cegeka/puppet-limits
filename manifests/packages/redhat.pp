class limits::packages::redhat {
  $virtual_modules = lookup('profile::iac::repository_management::modules::virtual', Array, 'first', [])
  $ruby_module_present = !empty($virtual_modules.filter |$module| { $module =~ /^ruby/ })

  case $::os[release][major] {
    '8': {
      # In certain cases a ruby module stream is already added by the repository_management::modules::virtual profile
      # This leads to a duplicate declaration of the ruby module when used together with the limits profile
      # We will first check if a ruby module stream is already defined, and only create this resource if it is absent
      if ! $ruby_module_present {
        $repo_require = Dnf::Module['ruby']
        ensure_resource('dnf::module','ruby', { 'ensure' => 'present', 'stream' => '2.5' })
      } else {
      $repo_require = undef
      }
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
