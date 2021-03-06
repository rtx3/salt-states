# vi: set ft=yaml.jinja :

{% from 'gmetad/map.jinja' import map with context %}

gmetad:
  pkg.installed:
    - name:     {{ map.get('pkg', {}).get('name') }}
  service.running:
    - enable:      True
    - watch:
      - pkg:       gmetad

/etc/ganglia/gmetad.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ sls }}/etc/ganglia/gmetad.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - watch:
      - pkg:       gmetad
    - watch_in:
      - service:   gmetad
