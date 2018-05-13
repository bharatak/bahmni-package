#!/bin/sh

if [ -f /etc/bahmni-installer/bahmni.conf ]; then
. /etc/bahmni-installer/bahmni.conf
fi

export MOD_PROXY=/var/cache/mod_proxy

setupConfFiles() {
    rm -f /usr/local/apache2/conf/httpd.conf
    rm -f /usr/local/apache2/conf/ssl.conf

    ln -s /opt/bahmni-web/etc/httpd.conf /usr/local/apache2/conf/httpd.conf
    ln -s /opt/bahmni-web/etc/ssl.conf /usr/local/apache2/conf/ssl.conf
    ln -s /opt/bahmni-web/etc/emr_ssl.conf /usr/local/apache2/conf/emr_ssl.conf

    mkdir -p /var/www/html
}

setupCacheDir(){
    rm -rf $MOD_PROXY
    mkdir $MOD_PROXY
}

setupApps(){
    mkdir -p /var/www/bahmniapps
    ln -s /opt/bahmni-web/etc/bahmniapps/ /var/www/bahmniapps
}

setupConfigs(){
    mkdir -p /var/www/bahmni_config
    ln -s /opt/bahmni-web/etc/bahmni_config/ /var/www/bahmni_config
    #TODO: Refactor bahmni-core to link bahmni_config instead like applicationDataDirectory/<bahmni_config>/openmrs/obscalculator
    #ln -s /opt/bahmni-web/etc/bahmni_config/openmrs/obscalculator /opt/openmrs/obscalculator
    #ln -s /opt/bahmni-web/etc/bahmni_config/openmrs/ordertemplates /opt/openmrs/ordertemplates
    #ln -s /opt/bahmni-web/etc/bahmni_config/openmrs/encounterModifier /opt/openmrs/encounterModifier
    #ln -s /opt/bahmni-web/etc/bahmni_config/openmrs/patientMatchingAlgorithm /opt/openmrs/patientMatchingAlgorithm
    #ln -s /opt/bahmni-web/etc/bahmni_config/openmrs/elisFeedInterceptor /opt/openmrs/elisFeedInterceptor
    #ln -s /opt/bahmni-web/etc/bahmni_config /opt/openmrs/bahmni_config #TODO: Why is this required?
}


setupOfflineMetadata(){
     ln -s /opt/bahmni-web/etc/offlineMetadata.json /var/www/html/offlineMetadata.json
}

setupConfFiles
setupCacheDir
setupApps
setupOfflineMetadata

if [[ "${IMPLEMENTATION_NAME:-default}" = "default" ]]; then
    setupConfigs
fi
