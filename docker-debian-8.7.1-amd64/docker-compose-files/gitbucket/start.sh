#!/bin/bash

GITBUCKET_HOME="/root/.gitbucket"
GITBUCKET_PLUGINS="${GITBUCKET_HOME}/plugins"

if [ ! -d "${GITBUCKET_PLUGINS}" ]; then
  ln -s /opt/gitbucket/plugins "${GITBUCKET_PLUGINS}"
fi

exec java -jar /opt/gitbucket/gitbucket.war
