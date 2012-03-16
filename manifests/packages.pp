class limits::packages {

  case $operatingsystem {
    debian, ubuntu: {
      include limits::packages::debian
    }
    redhat, centos, fedora: {
      include limits::packages::redhat
    }
    default: {
      fail("Module ${module_name} is not supported on ${operatingsystem}")
    }
  }

}
