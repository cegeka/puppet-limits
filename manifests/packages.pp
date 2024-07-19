class limits::packages {

  case $facts['os']['name'] {
    'Debian','Ubuntu': {
      include limits::packages::debian
    }
    'RedHat','CentOS','Fedora': {
      include limits::packages::redhat
    }
    default: {
      fail("Module ${module_name} is not supported on ${facts['os']['name']}")
    }
  }

}
