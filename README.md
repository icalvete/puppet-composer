#puppet-composer

Puppet manifest to composer 

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-composer.png)](http://travis-ci.org/icalvete/puppet-composer)

See [Composer site](https://getcomposer.org/)

##Example:

```puppet
node 'ubuntu01.smartpurposes.net' inherits test_defaults {
  include composer

  Class['php5'] -> Class['composer']
}
```

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
