# == Class: pedemo
#
# Full description of class pedemo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'pedemo':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class pedemo {
  # Configurations for Linux Nodes
  if $::kernel == 'Linux' {
    file {'/root/.ssh':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
    } ->

    file { '/root/.ssh/authorized_keys':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('pedemo/authorized_keys.erb'),
    }
  }
  # Configurations for Windows Nodes
  elsif $::kernel == 'windows'{
    user { 'Administrator':
      ensure  => 'present',
      comment => 'Built-in account for administering the computer/domain',
      groups  => ['BUILTIN\Administrators'],
      uid     => 'S-1-5-21-1177961462-1143904406-3688156191-500',
    }
  }

}
