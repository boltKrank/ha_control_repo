class profile::loadbalancer {

  class { 'haproxy' :
    global_options => {
      user  => 'root',
      group => 'root',
    },
  }

  haproxy::listen { "loadbalancer":
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '8140',
    options          => {
           'option'  => ['tcplog',],
           'balance' => 'roundrobin',
                    },
  }
  
  haproxy::balancermember { 'compile1':
    listening_service => 'loadbalancer',
    server_names      => 'compile1.localdomain',
    ipaddresses       => '192.168.0.57',
    ports             => '8140',
    options           => 'check',
  }

  haproxy::balancermember { 'compile2':
    listening_service => 'loadbalancer',
    server_names      => 'compile2.localdomain',
    ipaddresses       => '192.168.0.58',
    ports             => '8140',
    options           => 'check',
  }
  

}
