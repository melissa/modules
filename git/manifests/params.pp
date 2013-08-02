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
    'Darwin': {
      $packages = "git-1.8.3.2-intel-universal-snow-leopard.dmg"
      $providers = 'pkgdmg'
      $sources = "https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg"
      file { '/usr/local/bin':
        ensure => directory,
      }
      file { "/usr/local/bin/git":
        ensure => link,
        target => "/usr/local/git/bin/git",
      }
    }
  default:   { fail("No git package known for operating system ${operatingsystem}") }
  }
}
