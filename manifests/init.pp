class hiera (
  $config         = $hiera::params::config,
  $backends       = $hiera::params::backends,
  $hierarchy      = $hiera::params::hierarchy,
  $backend_config = $hiera::params::backend_config,
  $merge_behavior = $hiera::params::merge_behavior,
) inherits hiera::params {

  file { "${config}_hiera.yaml":
    ensure  => present,
    path    => $config,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('hiera/hiera.yaml.erb')
  }
}
