# This class makes sure all the packages that are essential and commonly used
# when building a package are present on the current system.

class osxbuilder::packages::essential {
    #$builder_packages = [
    #    'curl',
    #    'hdiutil',
    #    'installer',
    #    'source',
    #]

    #package { $builder_packages:
    #  ensure => present,
    #  source => ["/usr/bin", "/usr/sbin"],
    #}

    include git
}
