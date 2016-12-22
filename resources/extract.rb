#
# Cookbook Name:: tar
# Resource:: extract
#
# Author:: Nathan L Smith (<nathan@cramerdev.com>)
# Author:: George Miranda (<gmiranda@chef.io>)
# Author:: Mark Van de Vyver (<mark@taqtiqa.com>)
#
# Copyright:: 2011, Cramer Development, Inc.
# Copyright:: 2012-2016, Chef Software, Inc.
# Copyright:: 2013, TAQTIQA LLC.
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

actions :extract, :extract_local
default_action :extract

attribute :source,                kind_of: String, name_attribute: true
attribute :checksum,              kind_of: String
attribute :download_dir,          kind_of: String, default: Chef::Config[:file_cache_path]
attribute :group,                 kind_of: String, default: 'root'
attribute :mode,                  kind_of: String, default: '0755'
attribute :target_dir,            kind_of: String
attribute :creates,               kind_of: String
attribute :compress_char,         kind_of: String, default: 'z'
attribute :tar_flags,             kind_of: [String, Array], default: []
attribute :user,                  kind_of: String, default: 'root'
attribute :headers,               kind_of: Hash, default: nil
attribute :use_etag,              kind_of: [TrueClass, FalseClass], default: true
attribute :use_last_modified,     kind_of: [TrueClass, FalseClass], default: true
attribute :atomic_update,         kind_of: [TrueClass, FalseClass], default: true
attribute :force_unlink,          kind_of: [TrueClass, FalseClass], default: false
attribute :manage_symlink_source, kind_of: [TrueClass, FalseClass], default: nil
