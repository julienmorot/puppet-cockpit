# Class: cockpit
# ===========================
#
# Full description of class cockpit here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'cockpit':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class cockpit ($package, $service, $tcp_port) {
#class cockpit {

  Package { $package: 
    ensure => present
  }

  Service { $cockpit::service:
    enable => true,
    ensure => running,
    require => Package[$cockit::package]
  }

  Firewall { '100 Accept Cockpit on all interfaces':
    proto  => tcp,
    action => accept,
    dport => $cockpit::tcp_port,
    iniface => all
  }
}
