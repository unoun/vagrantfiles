FROM openjdk:8-jre

ADD https://github.com/gitbucket/gitbucket/releases/download/4.13/gitbucket.war /opt/gitbucket/

# https://github.com/gitbucket/gitbucket/releases/download/4.13/gitbucket.war.sha256
RUN echo "fb61cc1b9fc4ea48fc9edfc3847800d8ed4e2fab0ed74f2b63992bf3c863d2a7 /opt/gitbucket/gitbucket.war" | sha256sum -c -

ADD https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.8.0/gitbucket-gist-plugin_2.12-4.8.0.jar /opt/gitbucket/plugins/
ADD https://github.com/gitbucket/gitbucket-emoji-plugin/releases/download/4.4.0/gitbucket-emoji-plugin_2.12-4.4.0.jar /opt/gitbucket/plugins/

ADD start.sh /opt/gitbucket/
RUN chmod 755 /opt/gitbucket/start.sh

RUN mkdir /opt/gitbucket/tmp

EXPOSE 8080

CMD ["/opt/gitbucket/start.sh"]
