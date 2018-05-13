FROM bahmni/openmrs:latest
maintainer 'bahmni-tw@bahmni.com'
ADD build/distro/distro-*-SNAPSHOT/reporting-1.12.0.omod /opt/openmrs/modules/reporting-1.12.0.omod
ADD build/distro/distro-*-SNAPSHOT/uilibrary-2.0.5.omod /opt/openmrs/modules/uilibrary-2.0.5.omod
ADD build/distro/distro-*-SNAPSHOT/emrapi-1.24.0-SNAPSHOT.omod /opt/openmrs/modules/emrapi-1.24.0-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/episodes-1.0-SNAPSHOT.omod /opt/openmrs/modules/episodes-1.0-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/bedmanagement-5.7.0-SNAPSHOT.omod /opt/openmrs/modules/bedmanagement-5.7.0-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/addresshierarchy-2.9.omod /opt/openmrs/modules/addresshierarchy-2.9.omod
ADD build/distro/distro-*-SNAPSHOT/appframework-2.10.0.omod /opt/openmrs/modules/appframework-2.10.0.omod
ADD build/distro/distro-*-SNAPSHOT/htmlwidgets-1.8.0.omod /opt/openmrs/modules/htmlwidgets-1.8.0.omod
ADD build/distro/distro-*-SNAPSHOT/rulesengine-0.91-SNAPSHOT.omod /opt/openmrs/modules/rulesengine-0.91-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/bahmni.ie.apps-0.91-SNAPSHOT.omod /opt/openmrs/modules/bahmni.ie.apps-0.91-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/auditlog-1.0-SNAPSHOT.omod /opt/openmrs/modules/auditlog-1.0-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/owa-1.9.0.omod /opt/openmrs/modules/owa-1.9.0.omod
ADD build/distro/distro-*-SNAPSHOT/bacteriology-1.1-SNAPSHOT.omod /opt/openmrs/modules/bacteriology-1.1-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/webservices.rest-2.20.0.omod /opt/openmrs/modules/webservices.rest-2.20.0.omod
ADD build/distro/distro-*-SNAPSHOT/calculation-1.2.omod /opt/openmrs/modules/calculation-1.2.omod
ADD build/distro/distro-*-SNAPSHOT/appointments-1.0-SNAPSHOT.omod /opt/openmrs/modules/appointments-1.0-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/idgen-webservices-1.2-SNAPSHOT.omod /opt/openmrs/modules/idgen-webservices-1.2-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/event-2.5.omod /opt/openmrs/modules/event-2.5.omod
ADD build/distro/distro-*-SNAPSHOT/bahmnicore-0.91-SNAPSHOT.omod /opt/openmrs/modules/bahmnicore-0.91-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/reference-data-0.91-SNAPSHOT.omod /opt/openmrs/modules/reference-data-0.91-SNAPSHOT.omod
ADD build/distro/distro-*-SNAPSHOT/uicommons-2.0.omod /opt/openmrs/modules/uicommons-2.0.omod
ADD build/distro/distro-*-SNAPSHOT/legacyui-1.3.3.omod /opt/openmrs/modules/legacyui-1.3.3.omod
ADD build/distro/distro-*-SNAPSHOT/uiframework-3.8.omod /opt/openmrs/modules/uiframework-3.8.omod
ADD build/distro/distro-*-SNAPSHOT/idgen-4.4.1.omod /opt/openmrs/modules/idgen-4.4.1.omod
ADD build/distro/distro-*-SNAPSHOT/serialization.xstream-0.2.12.omod /opt/openmrs/modules/serialization.xstream-0.2.12.omod
ADD build/distro/distro-*-SNAPSHOT/metadatamapping-1.3.1.omod /opt/openmrs/modules/metadatamapping-1.3.1.omod
ADD build/distro/distro-*-SNAPSHOT/openmrs-atomfeed-2.5.6.omod /opt/openmrs/modules/openmrs-atomfeed-2.5.6.omod
ADD build/distro/distro-*-SNAPSHOT/metadatasharing-1.2.2.omod /opt/openmrs/modules/metadatasharing-1.2.2.omod
ADD build/distro/distro-*-SNAPSHOT/providermanagement-2.5.0.omod /opt/openmrs/modules/providermanagement-2.5.0.omod
ADD resources/bahmni-emr.conf /opt/openmrs/etc/bahmni-emr.conf
ADD resources/run-liquibase.sh /opt/openmrs/etc/run-liquibase.sh
ADD resources/bahmnicore.properties /opt/openmrs/bahmnicore.properties
ADD resources/blank-user.png /opt/openmrs/etc/blank-user.png
ADD resources/emr_ssl.conf /opt/openmrs/etc/emr_ssl.conf
ADD scripts/docker/postinstall.sh /opt/openmrs/bin/emr-postinstall.sh
RUN /opt/openmrs/bin/emr-postinstall.sh
