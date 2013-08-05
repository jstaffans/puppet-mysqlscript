puppet-mysqlscript
==================

Puppet module for running arbitrary mysql scripts


## Usage:

```
  class { 'mysqlscript':
    snippets_dir => '/opt/my-sql-snippets',
  }

  mysqlscript::run_script { 'create-db.sql': }
```
