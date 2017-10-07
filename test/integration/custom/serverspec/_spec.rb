require 'serverspec'

# Required by serverspec
set :backend, :exec


describe package('mysql-server') do
  it { should be_installed }
end

describe package('mysql-client') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end

describe port('3306') do
  it { should be_listening }
end

describe file('/etc/mysql/my.cnf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end


describe 'MySQL config' do
  context mysql_config('port') do
    its(:value) { should eq 3306 }
  end

  context mysql_config('socket') do
    its(:value) { should eq '/var/run/mysqld/mysqld.sock' }
  end

  context mysql_config('pid-file') do
    its(:value) { should eq '/var/run/mysqld/mysqld.pid' }
  end

  context mysql_config('basedir') do
    its(:value) { should eq '/usr' }
  end

  context mysql_config('datadir') do
    its(:value) { should eq '/var/lib/mysql/' }
  end

  context mysql_config('tmpdir') do
    its(:value) { should eq '/tmp' }
  end

  context mysql_config('lc-messages-dir') do
    its(:value) { should eq '/usr/share/mysql/english/' }
  end

  context mysql_config('lc-messages') do
    its(:value) { should eq 'en_US' }
  end

  context mysql_config('external-locking') do
    its(:value) { should eq "FALSE" }
  end

  context mysql_config('bind-address') do
    its(:value) { should eq '127.0.0.1' }
  end

  context mysql_config('key-buffer-size') do
    its(:value) { should eq 16777216 }
  end

  context mysql_config('max-allowed-packet') do
    its(:value) { should eq 16777216 }
  end

  context mysql_config('thread-stack') do
    its(:value) { should eq 196608 }
  end

  context mysql_config('thread-cache-size') do
    its(:value) { should eq 8 }
  end

  context mysql_config('myisam-recover-options') do
    its(:value) { should eq 'BACKUP' }
  end

  context mysql_config('max-connections') do
    its(:value) { should eq 100 }
  end

  context mysql_config('table-cache') do
    its(:value) { should eq 64 }
  end

  context mysql_config('thread-concurrency') do
    its(:value) { should eq 10 }
  end

  context mysql_config('query-cache-limit') do
    its(:value) { should eq 1048576 }
  end

  context mysql_config('query-cache-size') do
    its(:value) { should eq 16777216 }
  end

  context mysql_config('general-log-file') do
    its(:value) { should eq '/var/log/mysql/mysql.log' }
  end

  context mysql_config('general-log') do
    its(:value) { should eq "TRUE" }
  end

  context mysql_config('log-error') do
    its(:value) { should eq '/var/log/mysql/error.log' }
  end

  context mysql_config('slow-query-log-file') do
    its(:value) { should eq '/var/log/mysql/mysql-slow.log' }
  end

  context mysql_config('slow-query-log') do
    its(:value) { should eq "TRUE" }
  end

  context mysql_config('long-query-time') do
    its(:value) { should eq 2 }
  end

  context mysql_config('log-queries-not-using-indexes') do
    its(:value) { should eq "FALSE" }
  end

  context mysql_config('server-id') do
    its(:value) { should eq 1 }
  end

  context mysql_config('log-bin') do
    its(:value) { should eq '/var/log/mysql/mysql-bin' }
  end

  context mysql_config('expire-logs-days') do
    its(:value) { should eq 10 }
  end

  context mysql_config('max-binlog-size') do
    its(:value) { should eq 104857600 }
  end

  context mysql_config('ssl-ca') do
    its(:value) { should eq '/etc/mysql/cacert.pem' }
  end

  context mysql_config('ssl-cert') do
    its(:value) { should eq '/etc/mysql/server-cert.pem' }
  end

  context mysql_config('ssl-key') do
    its(:value) { should eq '/etc/mysql/server-key.pem' }
  end
end
