# vi: set ft=yaml.jinja :

{% from 'postgresql/map.jinja' import map with context %}

postgresql:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - enable:      True
    - reload:      True
    - watch:
      - pkg:       postgresql

{% if salt['config.get']('os_family') == 'RedHat' %}

service postgresql initdb:
  cmd.run:
    - unless:      test -f /var/lib/pgsql/data/postgresql.conf
    - require:
      - pkg:       postgresql
    - require_in:
      - service:   postgresql

{% endif %}
