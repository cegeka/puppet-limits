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
# include limits
# limits::conf { "test-soft-nofile": domain => "test", type => "soft", item => "nofile", value => "8192" }
#
# [Remember: No empty lines between comments and class definition]
class limits {

  file { '/etc/security/limits.d':
    ensure  => absent,
    recurse => true,
    force   => true,
  }

}
