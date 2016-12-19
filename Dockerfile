FROM node:0.12.7

ENV RUBY_MAJOR 1.9
ENV RUBY_VERSION 1.9.3-p551
ENV PHANTOMJS_VERSION 1.9.8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN mkdir -p /usr/src/app

RUN apt-get update &&\
    apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev 
python-software-properties libffi-dev unzip

RUN wget https://github.com/rbenv/rbenv/archive/v1.1.0.zip &&\
    unzip v1.1.0.zip &&\
	/rbenv-1.1.0/bin/rbenv init - &&\
	wget https://github.com/rbenv/ruby-build/archive/v20161121.zip &&\
	unzip v20161121.zip && mkdir ~/.rbenv/plugins &&\
	mv ruby-build-20161121 ~/.rbenv/plugins/ruby-build &&\
	/rbenv-1.1.0/bin/rbenv install 2.2.0 && /rbenv-1.1.0/bin/rbenv global 2.2.0

ENV PATH="/root/.rbenv/versions/2.2.0/bin:/opt/gtk/bin:${PATH}"
RUN gem install sass
