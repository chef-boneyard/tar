#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2016, Chef Software, Inc.

apt_update 'update'

include_recipe 'tar::default'
