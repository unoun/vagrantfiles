FROM openjdk:8-jre

ADD https://github.com/gitbucket/gitbucket/releases/download/4.12/gitbucket.war /opt/gitbucket/

# https://github.com/gitbucket/gitbucket/releases/download/4.12/gitbucket.war.sha256
RUN echo "230b8e87625c19aec3137eaaf40ee73f45b588044d4c4d355ee291dd7ddcddd2 /opt/gitbucket/gitbucket.war" | sha256sum -c -

ADD https://github.com/gitbucket/gitbucket-gist-plugin/releases/download/4.8.0/gitbucket-gist-plugin_2.12-4.8.0.jar /opt/gitbucket/plugins/
ADD https://github.com/gitbucket/gitbucket-emoji-plugin/releases/download/4.4.0/gitbucket-emoji-plugin_2.12-4.4.0.jar /opt/gitbucket/plugins/

ADD start.sh /opt/gitbucket/
RUN chmod 755 /opt/gitbucket/start.sh

EXPOSE 8080

CMD ["/opt/gitbucket/start.sh"]
