class composer::install {

  file{ 'composer_install_dir':
    ensure => directory,
    path   => $composer::install_dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  exec{ 'composer_install':
    command     => 'curl -sS https://getcomposer.org/installer | php  -d memory_limit=-1',
    user        => 'root',
    cwd         => $composer::install_dir,
    provider    => 'shell',
    require     => File['composer_install_dir'],
    environment => 'COMPOSER_HOME=/root',
    unless      => "/usr/bin/test -f ${composer::install_dir}/composer.phar"
  }

  file { '/usr/local/bin/composer.phar':
    ensure => link,
    target => "${composer::install_dir}/composer.phar"
  }
}
