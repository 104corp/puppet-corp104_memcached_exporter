class corp104_memcached_exporter::service inherits corp104_memcached_exporter {

  $real_provider = $corp104_memcached_exporter::init_style ? {
    'sles'  => 'redhat',  # mimics puppet's default behaviour
    'sysv'  => 'redhat',  # all currently used cases for 'sysv' are redhat-compatible
    default => $corp104_memcached_exporter::init_style,
  }

  service { 'memcached-exporter':
    ensure   => $corp104_memcached_exporter::service_ensure,
    name     => $corp104_memcached_exporter::service_name,
    enable   => $corp104_memcached_exporter::service_enable,
    provider => $real_provider,
  }

}
