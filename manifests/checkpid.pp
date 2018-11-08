define monit::checkpid (
                          $pid,
                          $service    = undef,
                          $initscript = undef,
                          $monitname  = $name,
                          $ensure     = 'present'
                        ) {

  #TODO: directori dedicat a moduls gestionats

  # check process puppetd with pidfile /var/run/puppet/agent.pid
  #   start program "/etc/init.d/puppet start"
  #   stop  program "/etc/init.d/puppet stop"

  if($service==undef) and ($initscript==undef)
  {
    fail('which service do you want to restart today?')
  }

  file { "${monit::params::monitconfd}/${monitname}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['monit'],
    notify  => Service['monit'],
    content => template("${module_name}/checkpid.erb")
  }

}
