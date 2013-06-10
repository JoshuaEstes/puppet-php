####
#
#
#
class php::mod::xdebug
{

    package { 'php5-xdebug':
        ensure => present,
    }
}
