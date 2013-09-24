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

action :extract do
  r = new_resource
  basename = ::File.basename(r.name)
  local_archive = "#{r.download_dir}/#{basename}"

  remote_file basename do
    source r.name
    path local_archive
    backup false
    action :create
    group  r.group
    owner  r.user
    mode   r.mode
  end

  execute "extract #{basename}" do
    flags = r.tar_flags ? r.tar_flags.join(' ') : ''
    command "tar xfz #{local_archive} #{flags}"
    cwd r.target_dir
    creates r.creates
    group  r.group
    user   r.user
  end
end
