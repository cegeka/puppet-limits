define limits::conf($domain, $type, $item, $value) {

  include limits::packages

  $key = "$domain/$type/$item"
  $context = '/files/etc/security/limits.conf'

  $path_item = "domain[. = \"$domain\"][type = \"$type\" and item = \"$item\"]"
  $path_exact = "domain[. = \"$domain\"][type = \"$type\" and item = \"$item\" and value = \"$value\"]"
  $path_other = "domain[. = \"$domain\"][type = \"$type\" and item = \"$item\" and value != \"$value\"]"

  augeas { "limits.conf/$key/eof":
    context => $context,
    onlyif  => 'match #comment[. =~ regexp("End of file")] size > 0',
    changes => 'rm #comment[. =~ regexp("End of file")]',
    require => Class['limits::packages'],
  }

  augeas { "limits.conf/$key/rm":
    context => $context,
    onlyif  => "match $path_other size > 0",
    changes => "rm $path_item",
    before  => Augeas["limits.conf/$key/add"],
    require => Class['limits::packages'],
  }

  augeas { "limits.conf/$key/add":
    context => $context,
    onlyif  => "match $path_exact size == 0",
    changes => [
      "set domain[last()+1] $domain",
      "set domain[last()]/type $type",
      "set domain[last()]/item $item",
      "set domain[last()]/value $value"
    ]
  }

}
