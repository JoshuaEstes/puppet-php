####
#
#
#
class php::mod::intl(
    $priority = 20
)
{

    package { 'php5-intl':
        ensure => present,
    }

    file { 'extra-intl.ini':
        path    => "/etc/php5/conf.d/intl.ini",
        ensure  => absent,
        require => Package['php5-intl'],
    }

    file { 'intl.ini':
        path    => '/etc/php5/mods-available/intl.ini',
        content => template('php/mod/intl.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php5-intl'],
    }

    file { "${priority}-intl.ini":
        ensure  => link,
        target  => '../mods-available/intl.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-intl.ini",
        require => File['apc.ini'],
    }

}
