define monit::checkscript (
                            $checkscript,
                            $service=undef,
                            $initscript=undef,
                            $monitname="$name",
                            $validreturn='0',
                            $timeout='10',
                            $ensure='present'
                          ) {

  # check program myscript with path /usr/local/bin/myscript.sh
  # 	start program "/etc/init.d/puppet start"
  # 	stop  program "/etc/init.d/puppet stop"
  #   if status != 0 then restart

  if($service==undef) and ($initscript==undef)
  {
    fail('which service do you want to restart today?')
  }

  file { "${monit::params::monitconfd}/checkscript_${monitname}":
    ensure  => $ensure,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    require => Package['monit'],
    notify  => Service["monit"],
    content => template("${module_name}/checkscript.erb")
  }

}
