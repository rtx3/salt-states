# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

golang-go:
  pkg:
    name:          golang

{% elif salt['config.get']('os_family') == 'Debian' %}

golang-go:
  pkg:
    name:          golang-go

{% endif %}
