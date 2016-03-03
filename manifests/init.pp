#
class monit inherits monit::params {

  #
  if ($monit::params::enableepel)
  {
    if ! defined(Class['epel'])
    {
      class { 'epel':
        before => Package['monit'],
      }
    }
  }

  package { 'monit':
    ensure  => 'installed',
  }

  service { 'monit':
    ensure  => 'running',
    enable  => true,
    require => Package['monit'],
  }

}
