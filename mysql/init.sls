# vim: ft=sls
# Init mysql
{%- from "mysql/map.jinja" import mysql with context %}
{# Below is an example of having a toggle for the state #}

{% if mysql.enabled %}
include:
  - mysql.install
  - mysql.config
  - mysql.service
{% else %}
'mysql-formula disabled':
  test.succeed_without_changes
{% endif %}

