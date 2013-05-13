####
#
# Manage php and php modules
#
class php
{

    package { 'php5':
        ensure => present,
    }

    package { 'php5-cli':
        ensure => present,
    }

    file { 'apache2/php.ini':
        content => template('php/apache2.php.ini.erb'),
        ensure  => present,
        group   => 'root',
        owner   => 'root',
        path    => '/etc/php5/apache2/php.ini',
        require => [
            File['/etc/php5/apache2'],
            File['/etc/php5/mods-available'],
            File['/etc/php5/conf.d'],
        ],
    }

    file { 'cli/php.ini':
        content => template('php/cli.php.ini.erb'),
        ensure  => present,
        group   => 'root',
        owner   => 'root',
        path    => '/etc/php5/cli/php.ini',
        require => [
            File['/etc/php5/cli'],
            File['/etc/php5/mods-available'],
            File['/etc/php5/conf.d'],
        ],
    }

    file { '/etc/php5/apache2':
        ensure  => directory,
        recurse => true,
    }

    file { '/etc/php5/cli':
        ensure  => directory,
        recurse => true,
    }

    file { '/etc/php5/mods-available':
        ensure  => directory,
        recurse => true,
    }

    file { '/etc/php5/conf.d':
        ensure  => directory,
        recurse => true,
    }

}
