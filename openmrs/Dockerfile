FROM frolvlad/alpine-oraclejdk8:8.161.12-cleaned
maintainer 'bahmni-tw@bahmni.com'
ADD build/libs/openmrs.jar /opt/openmrs/lib/openmrs.jar
ADD resources/openmrs-runtime-docker.properties /opt/openmrs/etc/openmrs-runtime.properties
ADD resources/openmrs-docker.conf /opt/openmrs/etc/openmrs.conf
ADD resources/log4j.xml /opt/openmrs/etc/log4j.xml
ADD resources/web.xml /opt/openmrs/etc/web.xml
ADD resources/main/openmrs.war /opt/openmrs/etc/openmrs.war
ADD resources/openmrs_clean_dump.sql /opt/openmrs/etc/openmrs_clean_dump.sql
ADD scripts/docker/postinstall.sh /opt/openmrs/bin/postinstall.sh
ADD resources/placeholder /opt/openmrs/run/placeholder
ADD resources/placeholder /opt/openmrs/log/placeholder
ADD resources/main/openmrs.war /opt/openmrs/openmrs.war
ADD resources/initDB.sh /opt/openmrs/openmrs/scripts/initDB.sh
ADD resources/openmrs_clean_dump.sql /opt/openmrs/openmrs/scripts/openmrs_clean_dump.sql
RUN /opt/openmrs/bin/postinstall.sh
ADD scripts/docker/openmrs /opt/openmrs/bin/openmrs
ADD scripts/docker/start.sh /opt/openmrs/bin/start.sh
ENTRYPOINT ["/opt/openmrs/bin/openmrs","start"]