class monit (
              $daemon      = '60',
              $logfile     = undef,
              $mailservers = [],
              $mail_from   = undef,
            ) inherits monit::params {

  if($monit::params::enableepel)
  {
    if(!defined(Class['epel']))
    {
      class { 'epel':
        before => Package['monit'],
      }
    }
  }

  package { 'monit':
    ensure  => 'installed',
  }

  file { $monit::params::monitconf:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/monitconf.erb"),
    require => Package['monit'],
  }

  service { 'monit':
    ensure  => 'running',
    enable  => true,
    require => File[$monit::params::monitconf],
  }

}
