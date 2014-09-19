# vi: set ft=yaml.jinja :

{% if   salt['config.get']('os_family') == 'RedHat' %}

/usr/bin/mailq:
  file:
    name:         /usr/bin/mailq.postfix

/usr/bin/newaliases:
  file:
    name:         /usr/bin/newaliases.postfix

/usr/lib/postfix:
  file:
    name:         /usr/libexec/postfix

/usr/sbin/sendmail:
  file:
    name:         /usr/sbin/sendmail.postfix

/usr/share/doc/postfix:
  file:
    name:         /usr/share/doc/postfix-2.6.6/README_FILES

/usr/share/doc/postfix/examples:
  file:
    name:         /usr/share/doc/postfix-2.6.6/samples

{% elif salt['config.get']('os_family') == 'Debian' %}

/usr/bin/mailq:
  file:
    name:         /usr/bin/mailq

/usr/bin/newaliases:
  file:
    name:         /usr/bin/newaliases

/usr/lib/postfix:
  file:
    name:         /usr/lib/postfix

/usr/sbin/sendmail:
  file:
    name:         /usr/sbin/sendmail

/usr/share/doc/postfix:
  file:
    name:         /usr/share/doc/postfix

/usr/share/doc/postfix/examples:
  file:
    name:         /usr/share/doc/postfix/examples

{% endif %}
