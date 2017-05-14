FROM openjdk:8-jre

ADD https://github.com/gitbucket/gitbucket/releases/download/4.12.1/gitbucket.war /opt/gitbucket/

# https://github.com/gitbucket/gitbucket/releases/download/4.12.1/gitbucket.war.sha256
RUN echo "22bdf74b31a0e8ea86ff469f88d0e3947b097cb6dd7c5f8b8d322959c9dd1f3e /opt/gitbucket/gitbucket.war" | sha256sum -c -

ADD https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.8.0/gitbucket-gist-plugin_2.12-4.8.0.jar /opt/gitbucket/plugins/
ADD https://github.com/gitbucket/gitbucket-emoji-plugin/releases/download/4.4.0/gitbucket-emoji-plugin_2.12-4.4.0.jar /opt/gitbucket/plugins/

ADD start.sh /opt/gitbucket/
RUN chmod 755 /opt/gitbucket/start.sh

RUN mkdir /opt/gitbucket/tmp

EXPOSE 8080

CMD ["/opt/gitbucket/start.sh"]
