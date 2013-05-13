####
#
#
#
class php::mod::xdebug(
    $priority = 00
)
{

    package { 'php5-xdebug':
        ensure => present,
    }

    file { 'extra-xdebug.ini':
        path   => "/etc/php5/conf.d/xdebug.ini",
        ensure => absent,
    }

    file { 'xdebug.ini':
        path    => '/etc/php5/mods-available/xdebug.ini',
        content => template('php/mod/xdebug.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php5-xdebug'],
    }

    file { "${priority}-xdebug.ini":
        ensure  => link,
        target  => '../mods-available/xdebug.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-xdebug.ini",
        require => File['xdebug.ini'],
    }

}
