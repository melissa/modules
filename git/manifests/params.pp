# = Class: git::params
#
class git::params {
  case $operatingsystem {
    'Debian': { $packages = 'git' }
    'Ubuntu': { $packages = 'git-core' }
    'Ubuntu': {
      case $operatingsystemrelease {
        'Hardy', 'Lucid': { $packages = 'git-core' }
        default: { $packages = 'git' }
      }
    }
   'CentOS', 'SLES', 'Ubuntu', 'RedHat', 'Fedora': { $packages = 'git' }
    'FreeBSD': { $packages = 'devel/git' }
    # default:   { fail("No git package known for operating system ${operatingsystem}") }
    'Darwin': { 
#       exec { 'download-git':
#	  command => "curl -O https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg",
#	  cwd => "/var/tmp",
#	  creates => "/var/tmp/git-1.8.3.2-intel-universal-snow-leopard.dmg",
#	  path => ["/usr/bin", "/usr/sbin"]
#	}
        $packages = "git-1.8.3.2-intel-universal-snow-leopard.dmg"
	$providers = 'appdmg'
	$sources = "https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg"
      exec { 'source /etc/profile': } 
    }
  }
}
