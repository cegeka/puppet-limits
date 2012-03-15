# Class: limits
#
# This module manages limits
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class limits {

  file { '/etc/security/limits.d':
    ensure  => absent,
    recurse => true,
    force   => true,
  }

}
