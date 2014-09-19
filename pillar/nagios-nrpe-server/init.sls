# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

nagios-nrpe-server:
  pkg:
    name:          nrpe
  service:
    name:          nrpe

{% elif salt['config.get']('os_family') == 'Debian' %}

nagios-nrpe-server:
  pkg:
    name:          nagios-nrpe-server
  service:
    name:          nagios-nrpe-server

{% endif %}
