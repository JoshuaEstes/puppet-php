####
#
#
#
class php::mod::mysql(
    $priority = 20
)
{

    package { 'php5-mysql':
        ensure => present,
    }

    file { 'extra-mysql.ini':
        path   => "/etc/php5/conf.d/mysql.ini",
        ensure => absent,
    }
    file { 'extra-mysqli.ini':
        path   => "/etc/php5/conf.d/mysqli.ini",
        ensure => absent,
    }
    file { 'extra-pdo.ini':
        path   => "/etc/php5/conf.d/pdo.ini",
        ensure => absent,
    }
    file { 'extra-pdo_mysql.ini':
        path   => "/etc/php5/conf.d/pdo_mysql.ini",
        ensure => absent,
    }

    file { 'mysql.ini':
        path    => '/etc/php5/mods-available/mysql.ini',
        content => template('php/mod/mysql.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php5-mysql'],
    }
    file { 'mysqli.ini':
        path    => '/etc/php5/mods-available/mysqli.ini',
        content => template('php/mod/mysqli.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php5-mysql'],
    }
    file { 'pdo.ini':
        path    => '/etc/php5/mods-available/pdo.ini',
        content => template('php/mod/pdo.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php5-mysql'],
    }
    file { 'pdo_mysql.ini':
        path    => '/etc/php5/mods-available/pdo_mysql.ini',
        content => template('php/mod/pdo_mysql.ini.erb'),
        ensure  => file,
        group   => 'root',
        owner   => 'root',
        require => Package['php5-mysql'],
    }

    file { "${priority}-mysql.ini":
        ensure  => link,
        target  => '../mods-available/mysql.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-mysql.ini",
        require => File['mysql.ini'],
    }
    file { "${priority}-mysqli.ini":
        ensure  => link,
        target  => '../mods-available/mysqli.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-mysqli.ini",
        require => File['mysqli.ini'],
    }
    file { "${priority}-pdo.ini":
        ensure  => link,
        target  => '../mods-available/pdo.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-pdo.ini",
        require => File['pdo.ini'],
    }
    file { "${priority}-pdo_mysql.ini":
        ensure  => link,
        target  => '../mods-available/pdo_mysql.ini',
        group   => 'root',
        owner   => 'root',
        path    => "/etc/php5/conf.d/${priority}-pdo_mysql.ini",
        require => File['pdo_mysql.ini'],
    }

}
