# Tar Cookbook Changelog

## v0.7.0 (2015-07-08)

* Add adoption notice
* Use `file_cache_path` instead of `file_backup_path` for downloaded artifact
  storage
* Fix links to Chef documentation in README

## v0.6.0 (2014-12-03)

* Allow either string or array for tar flags

## v0.5.0 (2014-07-28)

* Add support for more attributes of `remote_file`
* Escape downloaded file names

## v0.4.0 (2014-06-13)

* Add `archive_name` option for when the file name is different from the
  package name

## v0.3.4 (2014-06-05)

* Define ChefSpec::Runner method for tar_extract

## v0.3.3 (2014-06-03)

* Add ChefSpec matchers

## v0.3.2 (2014-05-05)

* Add checksum to remote file downloads

## v0.3.1 (2014-04-04)

* Correct "notifies" definition in tar_extract's remote_file

## v0.3.0 (2014-03-21)

* Add `:extract_local` action

## v0.2.0 (2013-12-31)

* Make `tar_extract` only run if needed
* Fix missing space in command line prefix
* Ensure `file_backup_path` exists on initial chef-client run
* Only add headers if needed

## v0.1.0 (2013-11-26)

* Allow custom HTTP headers when downloading files
* Allow the type of tar compression
* Improve resource notifications

## v0.0.4 (2013-10-02)

* Remove conditional download requests in favor of built-in functionality in Chef >= 11.6.0.
* Fix readme example
* Foodcritic fixes

## v0.0.3 (2013-01-30)

* Conditional requests for downloads
* Allow extract if non-root user
* Formatting fixes

## v0.0.2 (2012-10-13)

* Add `tar_extract` LWRP

## v0.0.1 (2011-09-15)

Initial release
