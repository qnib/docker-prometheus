#!/usr/local/bin/dumb-init /bin/bash


/opt/prometheus/prometheus -config.file=/etc/prometheus/prometheus.yml \
                -storage.local.path=/prometheus \
                -web.console.libraries=/usr/share/prometheus/console_libraries \
                -web.console.templates=/usr/share/prometheus/consoles
