FROM bitnami/base-ubuntu:14.04
MAINTAINER The Bitnami Team <containers@bitnami.com>

ENV BITNAMI_APP_NAME apache
ENV BITNAMI_APP_VERSION 2.4.12-1
ENV BITNAMI_APP_DIR=$BITNAMI_PREFIX/apache2
ENV BITNAMI_APP_VOL_PREFIX=/bitnami/$BITNAMI_APP_NAME
ENV BITNAMI_APP_USER daemon

RUN sh $BITNAMI_PREFIX/install.sh

ENV PATH $BITNAMI_APP_DIR/bin:$PATH

EXPOSE 80 443
VOLUME ["$BITNAMI_APP_VOL_PREFIX/conf", "$BITNAMI_APP_VOL_PREFIX/logs", "/app"]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["httpd"]
