class composer (
  
  $install_dir = $composer::params::install_dir

) inherits composer::params {

  anchor {'composer::begin':
    before => Class['composer::install']
  }
  class {'composer::install':
    require => Anchor['composer::begin']
  }
  class {'composer::config':
    require => Class['composer::install']
  }
  class {'composer::service':
    subscribe => Class['composer::config']
  }
  anchor {'composer::end':
    require => Class['composer::service']
  }
}
