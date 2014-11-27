#
# Cookbook Name:: tar
# Provider:: extract
#
# Author:: Nathan L Smith (<nathan@cramerdev.com>)
# Author:: George Miranda (<gmiranda@opscode.com>)
# Author:: Mark Van de Vyver (<mark@@taqtiqa.com>)
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
require 'shellwords'

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :extract do
  version = Chef::Version.new(Chef::VERSION[/^(\d+\.\d+\.\d+)/, 1])
  r = new_resource
  basename = ::File.basename(r.name)
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
    notifies :run, "execute[extract #{local_archive}]"
    if version.major > 11 || (version.major == 11 && version.minor >= 6)
      unless r.headers.nil?
        headers r.headers
      end
      use_etag r.use_etag
      use_last_modified r.use_last_modified
      atomic_update r.atomic_update
      force_unlink r.force_unlink
      manage_symlink_source r.manage_symlink_source
    end
  end

  extract_tar(local_archive, new_resource)
end

action :extract_local do
  extract_tar(new_resource.name, new_resource)
end

def extract_tar(local_archive, r)
  execute "extract #{local_archive}" do
    if r.tar_flags.kind_of?(String)
      flags = r.tar_flags
    else
      flags = r.tar_flags.join(' ')
    end
    command "tar xf#{r.compress_char} #{local_archive.shellescape} #{flags}"
    cwd r.target_dir
    creates r.creates
    group  r.group
    user   r.user
    action (r.creates || r.not_if.any? || r.only_if.any? ? :run : :nothing)
  end
end
