# monit

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What monit affects](#what-monit-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with monit](#beginning-with-monit)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

Install and configure monit package.

## Module Description

* Installs monit package.
* Ensures monit service is up.
* Defines configurations to check demons status using a PID or a Script.

## Setup

### Setup Requirements

Required Modules enabled:
* eyp/epel

### Beginning with monit

Setup the monit itself:
```puppet
class { 'monit': }
```

Setup additional configurations:
```puppet
monit::checkscript { 'testScript':
  checkscript => '/bin/true',
  service     => 'testScript',
}

monit::checkpid { 'testPID':
  pid         => '1234',
  service     => 'testPuppet',
}
```

## Usage

### Monit
No parameters allowed.

### monit::checkpid
* service: name of the service to check the PID.
* initscript: name of the init script of the service.
* monitname: name of the monitor.
* ensure: optional, default present, defines if the checkpid is present or not.

### monit::checkscript
* checkscript: path of the script to check.
* service: name of the service to check.
* initscript: init script of the service to check.
* monitname: name of the monit.
* validreturn: number equal to the exit output of the script to check.
* timeout: time before the timeout while checking a script.
* ensure: optional, default present, defines if the checkscript is present or not.

## Limitations

* Redhat and derivates: 6.
* Ubuntu: 14
* Others: Unsupported.
