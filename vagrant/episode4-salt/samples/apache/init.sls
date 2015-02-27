apache2:
  pkg:
    - installed

/var/www/html/index.html:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://apache2/index.template
    - template: jinja
