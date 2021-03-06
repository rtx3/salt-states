# vi: set ft=yaml.jinja :

{% set psls = sls.split('.')[0] %}

include:
  -  etcd
  -  supervisor

etcd:
  supervisord.running:
    - unless:    |-
                 ( echo    "${bootstrap}"                                      \
                 | grep -q "true"
                 )
    - watch:
      - service:   supervisor
      - file:     /etc/etcd/etcd.conf
      - file:     /etc/etcd/peer.conf
      - file:     /usr/bin/etcd
#     - cmd:       go get etcd

/etc/supervisor/conf.d/{{ psls }}.conf:
  file.managed:
    - template:    jinja
    - source:      salt://{{ psls }}/etc/supervisor/conf.d/{{ psls }}.conf
    - user:        root
    - group:       root
    - mode:       '0644'
    - require:
      - file:     /usr/bin/supervisord
    - require_in:
      - service:   supervisor
    - watch_in:
      - cmd:       supervisorctl update &
