class cockpit::install () inherits ::cockpit::params {
  $package = $cockpit::params::package
  $service = $cockpit::params::service
  $tcp_port = $cockpit::params::tcp_port

  Package { $package: 
    ensure => present
  }

  Service { $service:
    enable => true,
    ensure => running,
    require => Package[$package]
  }

  Firewall { '100 Accept Cockpit on all interfaces':
    proto  => tcp,
    action => accept,
    dport => $tcp_port,
    iniface => all
  }
}
