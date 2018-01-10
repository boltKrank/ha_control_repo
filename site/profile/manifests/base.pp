class profile::base {

  # Export host resource
  @@host { $facts['fqdn'] :
    ip => $facts['ipaddress'],
    host_aliases => "${facts['hostname']}.localdomain",
  }

  # Collect other host resources
  Host <<| |>>

}
