class profile::base {

  # Export host resource
  @@host { $facts['hostname'] :
    ip => $facts['ipaddress'],
  }

  # Collect other host resources
  Host <<| |>>

}
