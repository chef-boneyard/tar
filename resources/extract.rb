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

property :source,                String, name_property: true
property :checksum,              String
property :download_dir,          String, default: Chef::Config[:file_cache_path]
property :group,                 String, default: 'root'
property :mode,                  String, default: '0755'
property :target_dir,            String
property :creates,               String
property :compress_char,         String, default: 'z'
property :tar_flags,             [String, Array], default: []
property :user,                  String, default: 'root'
property :headers,               Hash
property :use_etag,              [TrueClass, FalseClass], default: true
property :use_last_modified,     [TrueClass, FalseClass], default: true
property :atomic_update,         [TrueClass, FalseClass], default: true
property :force_unlink,          [TrueClass, FalseClass], default: false
property :manage_symlink_source, [TrueClass, FalseClass]

require 'shellwords'

action :extract do
  r = new_resource
  basename = ::File.basename(r.name)
  extname  = ::File.extname(r.name)
  r.compress_char = '' if extname.casecmp('.xz') == 0
  local_archive = "#{r.download_dir}/#{basename}"

  directory r.download_dir do
    recursive true
  end

  remote_file basename do
    source r.name
    checksum r.checksum
    path local_archive
    backup false
    action :create
    group  r.group
    owner  r.user
    mode   r.mode
    headers r.headers unless r.headers.nil?
    use_etag r.use_etag
    use_last_modified r.use_last_modified
    atomic_update r.atomic_update
    force_unlink r.force_unlink
    manage_symlink_source r.manage_symlink_source
    notifies :run, "execute[extract #{local_archive}]"
  end

  extract_tar(local_archive, new_resource)
end

action :extract_local do
  extract_tar(new_resource.name, new_resource)
end

action_class.class_eval do
  def extract_tar(local_archive, r)
    execute "extract #{local_archive}" do
      flags = if r.tar_flags.is_a?(String)
                r.tar_flags
              else
                r.tar_flags.join(' ')
              end
      command "tar xf#{r.compress_char} #{local_archive.shellescape} #{flags}"
      cwd r.target_dir
      creates r.creates
      group  r.group
      user   r.user
      action (r.creates || r.not_if.any? || r.only_if.any? ? :run : :nothing)
    end
  end
end
