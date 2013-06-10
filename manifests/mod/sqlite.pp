####
#
#
#
class php::mod::sqlite
{

    package { 'php5-sqlite':
        ensure => present,
    }
}
