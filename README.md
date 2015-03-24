# wiz

[![Build Status](https://travis-ci.org/DimitriSteyaert/puppet-wiz.svg)](https://travis-ci.org/DimitriSteyaert/puppet-wiz)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What does the Wiz module do](#module-description)
3. [Setup - The basics of getting started with wiz](#setup)
    * [What wiz affects](#what-wiz-affects)
    * [Beginning with wiz](#beginning-with-wiz)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors](#contributors)

## Overview

The Wiz module installs wiz on your machine. [Wiz](https://github.com/classyllama/Wiz)
is the CLI for Magento.

## Module Description

The Wiz CLI tool is installed by this module with a default set of parameters.
These parameters such as the installation destination and repository can be adjusted
to your likings.

## Setup

### What wiz affects

* Creates the folder wiz under `/usr/share/`
* Installs git if this isn't already installed
* Creates a symlink in `/usr/bin/`
* Creates a symlink to wiz.bash_completion.sh in `/etc/bash_completion.d/`

### Beginning with wiz

To install Wiz just use `include wiz` and you are set to go.

## Usage

To fully alter the installation destination and repository you can use this
extended version of the class.

```
class { 'wiz':
  install_dest  => '/usr/local/src/wiz',
  repository    => 'https://github.com/classyllama/Wiz',
  exec_location => '/usr/local/bin/',
}
```

## Limitations

This module should work on all the flavours of Debian/Ubuntu and RedHat/CentOS.

## Development

Don't hesitate to open an [issue](https://github.com/DimitriSteyaert/puppet-wiz/issues)
if you should encounter any bugs or other issues.

## Contributors

Just me at the moment:

* Dimitri Steyaert <puppet@dimitri.eu>
