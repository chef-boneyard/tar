#
# Cookbook Name:: tar
# Resource:: package
#
# Author:: Nathan L Smith (<nathan@cramerdev.com>)
#
# Copyright 2011, Cramer Development, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :install

attribute :source,           :kind_of => String, :name_attribute => true
attribute :headers,          :kind_of => Hash,   :default => {}
attribute :prefix,           :kind_of => String
attribute :source_directory, :kind_of => String, :default => '/usr/local/src'
attribute :creates,          :kind_of => String
attribute :configure_flags,  :kind_of => Array,  :default => []
attribute :archive_name,     :kind_of => String

version = Chef::Version.new(Chef::VERSION[/^(\d+\.\d+\.\d+)/, 1])
if version.major > 11 || (version.major == 11 && version.minor >= 6)
  attribute :headers, :kind_of => Hash, :default => nil
  attribute :use_etag, :kind_of => [TrueClass, FalseClass], :default => true
  attribute :use_last_modified, :kind_of => [TrueClass, FalseClass], :default => true
  attribute :atomic_update, :kind_of => [TrueClass, FalseClass], :default => true
  attribute :force_unlink, :kind_of => [TrueClass, FalseClass], :default => false
  attribute :manage_symlink_source, :kind_of => [TrueClass, FalseClass], :default => nil
end

default_action :install
