# == Class: wiz
#
# This class installs Wiz, the CLI for Magento.
#
# === Parameters
#
# All of the variables are optional and should only be changed if you
# would like to install Wiz on a location that is different from the default
# and from a repository from another location.
#
# [*install_dest*]
#   By default wiz is downloaded into the folder /usr/share/wiz. If you would
#   like to download Wiz into another folder you can edit this parameter.
#
# [*repository*]
#   Wiz is downloaded from the repository https://github.com/classyllama/Wiz
#   but if you would like to get Wiz from another repository then you can
#   pass that repository to this parameter.
#
# [*exec_location*]
#   The executable is configured in /usr/bin by default, if you would like to
#   launch Wiz from another executable path then pass that path to the
#   exec_location parameter.
#
# === Examples
#
#  class { 'wiz': } # for installation with default parameters.
#
#  class { 'wiz':
#    install_dest  => '/usr/share/wiz',
#    repository    => 'https://github.com/classyllama/Wiz',
#    exec_location => '/usr/bin/',
#  }
#
# === Authors
#
# Dimitri Steyaert <dimitri@steyaert.be>
#
# === Copyright
#
# Copyright 2015 Dimitri Steyaert.
#
class wiz (
  $install_dest  = '/usr/share/wiz',
  $repository    = 'https://github.com/classyllama/Wiz',
  $exec_location = '/usr/bin/',
) {
  exec { 'clone-wiz':
    creates   => $install_dest,
    command   => "git clone ${repository} ${install_dest}",
    path      => ['/usr/local/bin', '/usr/bin'],
    logoutput => true,
    require   => Package['git'],
  }
  package { 'git':
    ensure => installed,
  }
  file { "${exec_location}/wiz":
    ensure  => "${install_dest}/wiz",
    require => Exec['clone-wiz'],
  }
  file { '/etc/bash_completion.d/wiz':
    ensure  => "${install_dest}/wiz.bash_completion.sh",
    require => Exec['clone-wiz'],
  }
}
