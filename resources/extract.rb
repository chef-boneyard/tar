#
# Cookbook Name:: tar
# Resource:: package
#
# Author:: Nathan L Smith (<nathan@cramerdev.com>)
# Author:: George Miranda (<gmiranda@opscode.com>)
#
# Copyright 2011, Cramer Development, Inc.
# Copyright 2012, Opscode, Inc.
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

actions :extract

attribute :source,       :kind_of => String, :name_attribute => true
attribute :download_dir, :kind_of => String, :default => Chef::Config[:file_cache_path]
attribute :target_dir,   :kind_of => String
attribute :creates,      :kind_of => String
attribute :tar_flags,    :kind_of => Array,  :default => []

default_action :extract
