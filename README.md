# ota

This repository contains the data about current builds of Kenvyra used in the built-in updater.

## Dependencies

For using scripts here, you need a working Python 3.9 or newer with `requests` and `tqdm` installed.

## Updating

`./github_release.sh /path/to/vanilla.zip /path/to/microg.zip /path/to/gapps.zip`

This creates a GitHub release with the three built ZIPs.

`./update.py GITHUB_RELEASES_DOWNLOAD_LINK_FOR_ZIP`

This adds the OTA JSON file.

There are more options to speed this up, see `./update.py --help`.
