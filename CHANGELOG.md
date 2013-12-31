# Tar Cookbook Changelog

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
