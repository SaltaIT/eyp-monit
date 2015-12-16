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
    enable  => true,
    ensure  => "running",
    require => Package['monit'],
  }

}
