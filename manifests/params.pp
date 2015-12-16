#
class monit::params {

	case $::osfamily
	{
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^6.*$/:
        {
          $enableepel=true
          $monitconfd="/etc/monit.d"
        }
        default: { fail("Unsupported RHEL/CentOS version! - $::operatingsystemrelease")  }
      }
    }
		'Debian':
		{
			case $::operatingsystem
			{
				'Ubuntu':
				{
					case $::operatingsystemrelease
					{
						/^14.*$/:
						{
              $enableepel=false
              $monitconfd="/etc/monit/conf.d"
						}
						default: { fail("Unsupported Ubuntu version! - $::operatingsystemrelease")  }
					}
				}
				'Debian': { fail('Unsupported')  }
				default: { fail('Unsupported Debian flavour!')  }
			}
		}
		default: { fail('Unsupported OS!')  }
	}
}
