# vim: ft=sls
# Manage service for service mysql
{%- from "mysql/map.jinja" import mysql with context %}

mysql_service:
  service.{{ mysql.service.state }}:
    - name: {{ mysql.service.name }}
    - enable: {{ mysql.service.enable }}
    - watch:
        - file: mysql_config

