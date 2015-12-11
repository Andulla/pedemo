# pedemo class

class pedemo {
  # My current SSH Key
  $sshkey = 'My SSH key'
  # Password for the local user in Windows
  $password = 'MyPassword123'
  # Configurations for Linux Nodes
  if $::kernel == 'Linux' {
    file {'/root/.ssh':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0700',
    } ->

    file { '/root/.ssh/authorized_keys':
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      content => template('pedemo/authorized_keys.erb'),
    }
  }
  # Configurations for Windows Nodes
  elsif $::kernel == 'windows'{
    user { 'Andreas':
      ensure   => 'present',
      comment  => 'Andreas Wilke TSE Demo Account',
      groups   => ['BUILTIN\Administrators'],
      password => $password,
    }
  }

}
