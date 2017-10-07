# vim: ft=yaml
# Custom Pillar Data for mysql

mysql:
  enabled: true
  client:
    enabled: true
  server:
    enabled: true
  service:
    state: running
    name: mysql
    enable: true
  config:
    client:
      port: 3306
      socket: /var/run/mysqld/mysqld.sock
    mysqldsafe:
      socket: /var/run/mysqld/mysqld.sock
      nice: 0
    mysqld:
      user: mysql
      pid_file: /var/run/mysqld/mysqld.pid
      socket: /var/run/mysqld/mysqld.sock
      port: 3306
      basedir: /usr
      datadir: /var/lib/mysql
      tmpdir: /tmp
      lc_messages_dir: /usr/share/mysql/english
      lc_messages: en_US
      skip_external_locking: true
      bind-address: 127.0.0.1
      key_buffer: 16M
      max_allowed_packet: 16M
      thread_stack: 192K
      thread_cache_size: 8
      'myisam-recover': BACKUP
      max_connections: 100
      table_cache: 64
      thread_concurrency: 10
      query_cache_limit: 1M
      query_cache_size: 16M
      general_log_file: /var/log/mysql/mysql.log
      general_log: 1
      log_error: /var/log/mysql/error.log
      slow_query_log_file: /var/log/mysql/mysql-slow.log
      slow_query_log: 1
      long_query_time: 2
      log_queries_not_using_indexes: false
      server-id: 1
      log_bin: /var/log/mysql/mysql-bin.log
      expire_logs_days: 10
      max_binlog_size: 100M
      binlog_do_db: include_database_name
      binlog_ignore_db: include_database_name
      'ssl-ca': /etc/mysql/cacert.pem
      'ssl-cert': /etc/mysql/server-cert.pem
      'ssl-key': /etc/mysql/server-key.pem
    mysqldump:
      quick: true
      'quote-names': true
      max_allowed_packet: 16M
    mysql:
      'no-auto-rehash': ""
    isamchk:
      key_buffer: 6M
    includedir: /etc/mysql/conf.d/
