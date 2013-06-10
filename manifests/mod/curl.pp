####
#
#
#
class php::mod::curl
{

    package { 'php5-curl'
        ensure => present,
    }
}
