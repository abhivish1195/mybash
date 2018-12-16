#!/bin/bash

yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel

yum install  gcc perl-ExtUtils-MakeMaker

yum remove git

cd /usr/src
wget https://www.kernel.org/pub/software/scm/git/git-2.0.4.tar.gz
tar xzf git-2.0.4.tar.gz

cd git-2.0.4
make prefix=/usr/local/git all
make prefix=/usr/local/git install

echo 'export PATH=$PATH:/usr/local/git/bin' >> /etc/bashrc

source /etc/bashrc

git --version


echo "Done!"