FROM openjdk:8-jre

ADD https://github.com/gitbucket/gitbucket/releases/download/4.11/gitbucket.war /opt/gitbucket/
ADD https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.7.0/gitbucket-gist-plugin_2.12-4.7.0.jar /opt/gitbucket/plugins/
ADD https://github.com/gitbucket/gitbucket-emoji-plugin/releases/download/4.4.0/gitbucket-emoji-plugin_2.12-4.4.0.jar /opt/gitbucket/plugins/

ADD start.sh /opt/gitbucket/
RUN chmod 755 /opt/gitbucket/start.sh

EXPOSE 8080

CMD ["/opt/gitbucket/start.sh"]
