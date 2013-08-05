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
      $packages = "git"
      $providers = 'pkgdmg'
      $sources = "https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg"
    }
    default:   { fail("No git package known for operating system ${operatingsystem}") }
  }
}
