# vim: ft=sls
# How to install mysql
{%- from "mysql/map.jinja" import mysql with context %}

{% if mysql.client.enabled %}
mysql_client_pkg:
  pkg.installed:
    - name: {{ mysql.client.pkg }}
{% endif %}

{% if mysql.server.enabled %}
mysql_server_pkg:
  pkg.installed:
    - name: {{ mysql.server.pkg }}
{% endif %}
