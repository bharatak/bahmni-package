#!/bin/sh

. /etc/openmrs/openmrs.conf

. /etc/openmrs/bahmni-emr.conf

if [ -f /etc/bahmni-installer/bahmni.conf ]; then
. /etc/bahmni-installer/bahmni.conf
fi

link_dirs(){
    rm -rf /home/$OPENMRS_SERVER_USER/.OpenMRS/modules
    ln -s $MODULE_REPO /home/$OPENMRS_SERVER_USER/.OpenMRS/modules
    chown -R bahmni:bahmni /opt/openmrs/modules
}


#run_migrations(){
#    echo "Running openmrs liquibase-core-data.xml and liquibase-update-to-latest.xml"
#    /opt/openmrs/etc/run-liquibase.sh liquibase-core-data.xml
#    /opt/openmrs/etc/run-liquibase.sh liquibase-update-to-latest.xml
#}

create_configuration_dirs(){
    ln -s /opt/openmrs/bahmnicore.properties /home/$OPENMRS_SERVER_USER/.OpenMRS/bahmnicore.properties
    mkdir -p $PATIENT_IMAGES_DIR
    mkdir -p $DOCUMENT_IMAGES_DIR
    mkdir -p $UPLOADED_FILES_DIR
    mkdir -p $UPLOADED_RESULTS_DIR

    cp -f /opt/openmrs/etc/blank-user.png $PATIENT_IMAGES_DIR/blank-user.png

    chown -R bahmni:bahmni /opt/openmrs
    chown -R bahmni:bahmni $UPLOADS_DIR
    chmod 755 $UPLOADS_DIR;
    chmod -R 755 $PATIENT_IMAGES_DIR
    chmod -R 755 $DOCUMENT_IMAGES_DIR
    chmod -R 755 $UPLOADED_FILES_DIR
    chmod -R 755 $UPLOADED_RESULTS_DIR
}

#setupConfFiles() {
#    	rm -f /etc/httpd/conf.d/emr_ssl.conf
#    	cp -f /opt/openmrs/etc/emr_ssl.conf /etc/httpd/conf.d/emr_ssl.conf
#}

link_dirs
#if [ "${IS_PASSIVE:-0}" -ne "1" ]; then
#    run_migrations
#fi
create_configuration_dirs
#setupConfFiles



