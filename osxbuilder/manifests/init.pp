# Class: osxbuilder
#
# Actions:
#   - Ensures the osx has everything needed for building packages
#
# Sample Usage:
#   class { 'osxbuilder': }
#

class osxbuilder (
    $pe = false,
) {
    include osxbuilder::packages::essential
}
