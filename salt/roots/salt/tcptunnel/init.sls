tcptunnel:
  cmd.run:
    - cwd: /opt/
    - names:
        - git clone https://github.com/vakuum/tcptunnel.git && cd tcptunnel &&./configure && make
        - sudo ln -s /opt/tcptunnel/tcptunnel /usr/local/bin/tcptunnel
    - unless: test -f /usr/local/bin/tcptunnel