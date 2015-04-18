#!/bin/bash

source /etc/jelastic/environment;
export JAVA_HOME="/usr/java/default/";

#$J_OPENSHIFT_APP_ADM_USER        ;   Operate this variable for the username
#$J_OPENSHIFT_APP_ADM_PASSWORD    ;   Use this varible for your password

function _setPassword() {
        pass_hash=`echo -n ${J_OPENSHIFT_APP_ADM_USER}:ManagementRealm:${J_OPENSHIFT_APP_ADM_PASSWORD}|md5sum|awk '{print $1}'`;
        echo \n ${J_OPENSHIFT_APP_ADM_USER}=${pass_hash} >> /opt/repo/versions/7.2/standalone/configuration/mgmt-users.properties;
}
