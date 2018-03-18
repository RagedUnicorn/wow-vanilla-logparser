# Release

> This document explains how a new release is created for LogParser

* Update version of Addon
  * Code/Constants.lua - LP_CONSTANTS.ADDON_VERSION
* Check for loglevel in `LP_Logger.lua` and set level to 1 (error)
* Check for logEvent in `LP_Logger.lua` and set to false
* Create a new git tag
  * git tag vx.x.x
  * git push origin --tags
* Draft new Github release with description
  * Title should be the version e.g. vx.x.x
  * Short description of what was added newly
* Prepare upload of downloadable version to the created release
  * Download full created tag
  * Remove Docs folder to keep the footprint small
  * Remove git related files .git folder, .gitignore, .gitattributes
  * Remove or comment testclass entries from .toc
  * Pack to zipfile (make sure that the name of the unpacked folder is LogParser)
