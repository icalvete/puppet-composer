class composer::install {

  file{ 'composer_install_dir':
    ensure => directory,
    path   => $composer::install_dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  exec{ 'composer_install':
    command  => "curl -sS https://getcomposer.org/installer | php",
    user     => 'root',
    cwd      => $composer::install_dir,
    provider => 'shell',
    require  => File['composer_install_dir']
  }
}
