class profile::base {

  # Export host resource
  @@host { $facts['fqdn'] :
    ip => $facts['ipaddress'],
  }

  # Collect other host resources
  Host <<| |>>

}
