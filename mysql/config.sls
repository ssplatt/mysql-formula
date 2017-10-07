# vim: ft=sls
# How to configure mysql
{%- from "mysql/map.jinja" import mysql with context %}

mysql_config:
  file.managed:
    - name: '/etc/mysql/my.cnf'
    - source: salt://mysql/files/my.cnf.j2
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - config: {{ mysql.config }}
