class mysqlscript (
  $snippets_dir = undef,
  ) {

  define run_script() {
    $script = "$mysqlscript::snippets_dir/$name"

    file { $script:
      mode => "600",
    }

    exec {"mysql-import-$name":
      path    => ['/bin', '/sbin', '/usr/bin'],
      command => "mysql --defaults-file=/root/.my.cnf $db < $script && touch $script.semaphore", 
      creates => "$script.semaphore",
      require => File[$script],
      timeout => '0',
    }
  }

  file { $snippets_dir:
      ensure   => directory,
      mode => "700",
  }

  Class['mysql::server'] -> Class['mysqlscript']

}
