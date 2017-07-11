FROM centos:latest
MAINTAINER Eric Hayes <eric@erichayes.net>
RUN yum -y install epel-release
RUN yum -y install \
  bison \
  bzip2 \
  curl-devel \
  gcc \
  gcc-c++ \
  git \
  libffi \
  libffi-devel \
  libxml2-devel \
  libxslt-devel \
  libyaml-devel \
  make \
  openssl-devel \
  readline-devel \
  tar \
  vim-enhanced \
  wget \
  zlib-devel

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' > /etc/profile.d/rbenv.sh

ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.4.1
RUN rbenv global 2.4.1
RUN echo 'gem: --no-rdoc --no-ri' > /.gemrc
RUN /root/.rbenv/shims/gem update --system
