#!/bin/bash

GITBUCKET_HOME="/root/.gitbucket"
GITBUCKET_PLUGINS="${GITBUCKET_HOME}/plugins"
GITBUCKET_DB_CONF="${GITBUCKET_HOME}/database.conf"

if [ ! -d "${GITBUCKET_PLUGINS}" ]; then
  ln -s /opt/gitbucket/plugins "${GITBUCKET_PLUGINS}"
fi

if [ "${GITBUCKET_DB_URL}" -a "${GITBUCKET_DB_USERNAME}" -a "${GITBUCKET_DB_PASSWORD}" ]; then
  cat >${GITBUCKET_DB_CONF} <<_EOF
db {
  url = "${GITBUCKET_DB_URL}"
  user = "${GITBUCKET_DB_USERNAME}"
  password = "${GITBUCKET_DB_PASSWORD}"
}
_EOF
fi

exec java -jar /opt/gitbucket/gitbucket.war --temp_dir=/opt/gitbucket/tmp
