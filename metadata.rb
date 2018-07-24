name             'tar'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache-2.0'
description      'Installs tar and two resources to manage remote tar packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.2.0'

%w(ubuntu debian redhat centos suse opensuse opensuseleap scientific oracle amazon zlinux freebsd).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/tar'
issues_url 'https://github.com/chef-cookbooks/tar/issues'
chef_version '>= 12.7' if respond_to?(:chef_version)
