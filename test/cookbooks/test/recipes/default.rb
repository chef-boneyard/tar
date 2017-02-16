#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2016-2017, Chef Software, Inc.

apt_update 'update'

include_recipe 'tar::default'
include_recipe 'build-essential::default'

package 'ncurses-devel' if platform_family?('suse') # needed for nano compile

tar_package 'https://www.nano-editor.org/dist/v2.7/nano-2.7.4.tar.gz' do
  prefix '/usr/local'
  creates '/usr/local/bin/nano'
end

tar_extract 'https://www.nano-editor.org/dist/v2.7/nano-2.7.4.tar.gz' do
  target_dir '/usr/local'
  creates '/opt/myapp/mycode/lib'
  tar_flags ['-P', '--strip-components 1']
end
