####
#
#
#
class php::mod::mysql
{

    package { 'php5-mysql':
        ensure => present,
    }
}
