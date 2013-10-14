DESCRIPTION
===========

Installs tar and two resources for managing remote tar files.
`tar_package` handles remote source package compilation.
`tar_extract` handles retrieving remote tar files and extracting
them locally.

LICENSE AND AUTHOR
==================

Author:: Nathan L Smith (<nathan@cramerdev.com>)
Author:: George Miranda (<gmiranda@opscode.com>)
Author:: Mark Van de Vyver (<mark@@taqtiqa.com>)

Copyright 2011, Cramer Development, Inc.
Copyright 2011, Opscode, Inc.
Copyright 2013, TAQTIQA LLC.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Resources/Providers
===================

A `tar_package` LWRP provides an easy way to download remote files and compile and install them.  This only works for the most basic Autoconf programs that can do `./configure && make && make install`.

A `tar_extract` LWRP provides an easy way to download remote tar files and extract them to a local directory.

# Actions

`tar_package`
- :install: Installs the package

`tar_extract`
- :extract: Extracts the tar file

# Attribute Parameters

`tar_package`
- source: name attribute. The source remote URL.
- headers: request headers sent when downloading the file (for instance for authentication)
- prefix: Directory to be used as the `--prefix` configure flag.
- source\_directory: Directory to which source files are download.
- creates: A file this command creates - if the file exists, the command will not be run.
- configure\_flags: Array of additional flags to be passed to `./configure`.

`tar_extract`
- source: name attribute. The source remote URL.
- headers: request headers sent when downloading the file (for instance for authentication)
- target\_dir: Directory to extract into, e.g. tar xzf -C (target_dir)
- download\_dir: Directory to which tarball is downloaded (defaults to chef cache which requires root `group` and `user`).
- creates: A file this command creates - if the file exists, the command will not be run.
- tar\_flags: Array of additional flags to be passed to tar xzf command.
- group: Group name or group ID to extract the archive under. If set to non-root group, point to a `download_dir` the group has permission to access.
- user: User name or user ID to extract the archive under. If set to non-root user, point to a `download_dir` the user has permission to access.

# Example

    tar_package 'http://pgfoundry.org/frs/download.php/1446/pgpool-3.4.1.tar.gz' do
      prefix '/usr/local'
      creates '/usr/local/bin/pgpool'
    end

This will download, compile, and install the package from the given URL and install it into /usr/local.

    tar_extract 'http://dev.mycoderepo.com/artifacts/mycode-1.2.3.tar.gz' do
      target_dir '/opt/myapp/mycode'
      creates '/opt/myapp/mycode/lib'
      tar_flags [ '-P', '--strip-components 1' ]
    end

This will download the tarball to cache, extract the contents to /opt/myapp/mycode, use the file '/opt/myapp/mycode/bin' to determine idempotency, and pass both '-P' and '--strip-components 1' flags to the tar xzf command.

