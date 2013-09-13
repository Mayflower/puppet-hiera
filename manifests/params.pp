class hiera::params {
  case $::osfamily {
    'debian','darwin': {
      $config   = '/etc/puppet/hiera.yaml'
      $backends = ['puppet']
      $hierarchy = [
        '%{::environment}',
        'common'
      ]
      $backend_config = {
        puppet => {
          datasource => 'data'
        }
      }
      $merge_behavior = 'native'
    }
    default: {
      fail("${::osfamily} is not supported :(")
    }
  }
}
