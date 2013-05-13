####
#
#
#
class php::mod::apc(
    $priority = 20
)
{

    package { 'php-apc':
        ensure => present,
    }

    file { 'extra-apc.ini':
        path   => "/etc/php5/conf.d/apc.ini",
        ensure => absent,
    }

    file { 'apc.ini':
        path    => '/etc/php5/mods-available/apc.ini',
        content => template('php/mod/apc.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php-apc'],
    }

    file { "${priority}-apc.ini":
        ensure  => link,
        target  => '../mods-available/apc.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-apc.ini",
        require => File['apc.ini'],
    }

}
