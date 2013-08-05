# install everything required to be a git client
class git {

  include git::params

  if $operatingsystem == 'Darwin' {
    $sources = $git::params::sources
    file { '/usr/local/bin':
      ensure => directory,
      require => Package[$git::params::packages],
    }
    file { '/usr/local/bin/git':
      ensure => link,
      target => '/usr/local/git/bin/git',
      require => File['/usr/local/bin'],
    }
  }

  package { $git::params::packages:
    ensure => installed,
    source => $sources,
  }
}
