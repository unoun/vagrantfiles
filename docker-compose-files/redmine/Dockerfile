FROM redmine:latest

RUN apt-get update && apt-get -y install unzip less vim patch

RUN cd /tmp \
    && wget --local-encoding=UTF-8 \
        https://bitbucket.org/tkusukawa/redmine_work_time/downloads/redmine_work_time-0.3.4.zip \
    && cd /usr/src/redmine/plugins/ \
    && unzip /tmp/redmine_work_time-0.3.4.zip \
    && rm /tmp/redmine_work_time-0.3.4.zip

RUN cd /tmp \
    && wget --local-encoding=UTF-8 \
        https://github.com/onozaty/redmine-view-customize/archive/v1.1.4.tar.gz \
    && cd /usr/src/redmine/plugins/ \
    && tar xpzf /tmp/v1.1.4.tar.gz \
    && mv redmine-view-customize-1.1.4 view_customize \
    && rm /tmp/v1.1.4.tar.gz

COPY docker-entrypoint.sh.diff /tmp/
RUN patch /docker-entrypoint.sh /tmp/docker-entrypoint.sh.diff && rm /tmp/docker-entrypoint.sh.diff
