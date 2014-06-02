#
# Cookbook Name:: tar
# Resource:: extract
#
# Author:: Nathan L Smith (<nathan@cramerdev.com>)
# Author:: George Miranda (<gmiranda@opscode.com>)
# Author:: Mark Van de Vyver (<mark@taqtiqa.com>)
#
# Copyright 2011, Cramer Development, Inc.
# Copyright 2012, Opscode, Inc.
# Copyright 2013, TAQTIQA LLC.
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

attribute :source,         :kind_of => String, :name_attribute => true
attribute :checksum,       :kind_of => String
attribute :headers,        :kind_of => Hash,   :default => {}
attribute :download_dir,   :kind_of => String, :default => Chef::Config[:file_backup_path]
attribute :group,          :kind_of => String, :default => 'root'
attribute :mode,           :kind_of => String, :default => '0755'
attribute :target_dir,     :kind_of => String
attribute :creates,        :kind_of => String
attribute :compress_char,  :kind_of => String, :default => 'z'
attribute :tar_flags,      :kind_of => Array,  :default => []
attribute :user,           :kind_of => String, :default => 'root'

default_action :extract
