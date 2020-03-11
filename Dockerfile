FROM ubuntu:16.04

COPY varnish-install.sh /tmp/varnish-install.sh
COPY start.sh /start.sh

RUN chmod +x /tmp/varnish-install.sh && chmod +x /start.sh && /tmp/varnish-install.sh

CMD ["/start.sh"]
