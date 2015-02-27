/home/vagrant/.bashrc:
  file.managed:
    - source: salt://.bashrc
    - mode: 644
    - user: root
    - group: root

/root/.bashrc:
  file.managed:
    - source: salt://.bashrc
    - mode: 644
    - user: root
    - group: root