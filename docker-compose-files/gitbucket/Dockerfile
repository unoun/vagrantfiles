FROM openjdk:8-jre

ADD https://github.com/gitbucket/gitbucket/releases/download/4.14.1/gitbucket.war /opt/gitbucket/

# https://github.com/gitbucket/gitbucket/releases/download/4.14.1/gitbucket.war.sha256
RUN echo "cad3c2a13cc98ef0e2697c16cb79dc0a24c4ce99e7fe2fefed2ee7e75a52b014 /opt/gitbucket/gitbucket.war" | sha256sum -c -

ADD https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.9.0/gitbucket-gist-plugin_2.12-4.9.0.jar /opt/gitbucket/plugins/
ADD https://github.com/gitbucket/gitbucket-emoji-plugin/releases/download/4.4.0/gitbucket-emoji-plugin_2.12-4.4.0.jar /opt/gitbucket/plugins/

ADD start.sh /opt/gitbucket/
RUN chmod 755 /opt/gitbucket/start.sh

RUN mkdir /opt/gitbucket/tmp

EXPOSE 8080

CMD ["/opt/gitbucket/start.sh"]
