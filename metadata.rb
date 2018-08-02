name             'cookbook-stackstorm-docker'
maintainer       'Sean Kaufman'
license          'All rights reserved'
description      'Installs/Configures stackstorm via docker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends 'docker'
depends 'chef-yum-docker'
depends 'git'
