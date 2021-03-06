class profile::base {
  user { 'admin':
    ensure => present,
  }
  
  $facts['disks'].each |$disk|{
    exec {"dynamic scheduler change for ${disk}" :
      command     => "touch /tmp/\$disk",
      path        => '/usr/bin',
      provider    => 'shell',
      refreshonly => true
    }
  }
}
