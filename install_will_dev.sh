#!/bin/sh

mkdir install_will_dev
cd install_will_dev
echo "source 'https://supermarket.chef.io'\n\ncookbook 'will_dev', git: 'git://github.com/willryan/will_dev'\n" > Berksfile
berks vendor cookbooks
chef-client -z -o will_dev
cd ..
rm -r install_will_dev

