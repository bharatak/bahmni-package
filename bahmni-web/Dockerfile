FROM httpd:2.2-alpine

ADD resources/bahmni_config /opt/bahmni-web/etc/bahmni_config
ADD resources/bahmniapps /opt/bahmni-web/etc/bahmniapps
ADD resources/ssl.conf /opt/bahmni-web/etc/ssl.conf
ADD resources/emr_ssl.conf /opt/bahmni-web/etc/emr_ssl.conf
ADD resources/httpd.conf /opt/bahmni-web/etc/httpd.conf
ADD resources/run-liquibase.sh /opt/bahmni-web/etc/run-liquibase.sh
ADD resources/offlineMetadata.json /opt/bahmni-web/etc/offlineMetadata.json
ADD scripts/docker/postinstall.sh /opt/bahmni-web/etc/postinstall.sh
RUN /opt/bahmni-web/etc/postinstall.sh