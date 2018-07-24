#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2016-2017, Chef Software, Inc.

apt_update 'update'

include_recipe 'tar::default'
build_essential 'install compilation tools'

package 'ncurses-devel' if platform_family?('suse') # needed for nano compile

tar_package 'https://www.nano-editor.org/dist/v2.8/nano-2.8.7.tar.gz' do
  prefix '/usr/local'
  creates '/usr/local/bin/nano'
end

tar_extract 'https://www.nano-editor.org/dist/v2.8/nano-2.8.7.tar.gz' do
  target_dir '/usr/local/nano_tar_extract'
  creates '/usr/local/nano_tar_extract/configure'
  tar_flags ['-P', '--strip-components 1']
end
