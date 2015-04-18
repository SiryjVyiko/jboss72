#!/bin/bash

source /etc/jelastic/environment;
export JAVA_HOME="/usr/java/default/";

#$J_OPENSHIFT_APP_ADM_USER        ;   Operate this variable for the username
#$J_OPENSHIFT_APP_ADM_PASSWORD    ;   Use this varible for your password

function _setPassword() {
        #/opt/repo/versions/7.2/bin/add-user.sh --user ${J_OPENSHIFT_APP_ADM_USER} --password ${J_OPENSHIFT_APP_ADM_PASSWORD} --silent=true --enable
        pass_hash=`echo -n ${J_OPENSHIFT_APP_ADM_USER}:ManagementRealm:${J_OPENSHIFT_APP_ADM_PASSWORD}|md5sum|awk '{print $1}'`;
        echo ${J_OPENSHIFT_APP_ADM_USER}=${pass_hash} >> ${OPENSHIFT_WILDFLY_DIR}/versions/${Version}/configuration/standalone/configuration/mgmt-users.properties;
}
