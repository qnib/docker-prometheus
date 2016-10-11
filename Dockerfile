FROM qnib/alpn-consul

ARG PROMETHEUS_VER=1.2.1
ARG PROMETHEUS_URL=https://github.com/prometheus/prometheus/releases/download
RUN wget -qO - ${PROMETHEUS_URL}/v${PROMETHEUS_VER}/prometheus-${PROMETHEUS_VER}.linux-amd64.tar.gz |tar xfz - -C /opt/ \
 && mv /opt/prometheus-${PROMETHEUS_VER}.linux-amd64 /opt/prometheus

ADD etc/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
ADD etc/supervisord.d/prometheus.ini /etc/supervisord.d/
ADD opt/qnib/prometheus/bin/start.sh /opt/qnib/prometheus/bin/

EXPOSE     9090
VOLUME     [ "/prometheus" ]
