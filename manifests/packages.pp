class limits::packages {

  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      include limits::packages::debian
    }
    'RedHat,' 'CentOS', 'Fedora': {
      include limits::packages::redhat
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

}
