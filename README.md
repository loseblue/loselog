# loselog

A fast, cross-platform log viewer for large log files.

![loselog main window](website/static/screenshots/mainwindow.png)

[![GitHub license](https://img.shields.io/github/license/loseblue/loselog)](https://github.com/loseblue/loselog/blob/master/COPYING)
[![GitHub release](https://img.shields.io/github/v/release/loseblue/loselog)](https://github.com/loseblue/loselog/releases/latest)
[![C++](https://img.shields.io/badge/C%2B%2B-17-blue)]()
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey)]()

## Overview

Loselog is a multi-platform GUI application that helps browse and search
through long and complex log files. It is designed with developers and system
administrators in mind and can be seen as an interactive combination of
`grep`, `less`, and `tail`.

Loselog is forked from [klogg](https://github.com/variar/klogg), a mature
high-performance log viewer, and focuses on keeping the proven core stable
while continuing maintenance and improvements.

**Author:** [loseblue](https://github.com/loseblue)

## Features

- Drag multiple log files into the window at the same time; the log contents will open in order of filename within a single Tab. 
   - File -> Preference -> File -> Multi files in one tab
- Reads files directly from disk without loading the whole file into memory
- Handles huge text files, including 10+ GB logs
- Fast regular-expression search with Hyperscan and Qt regex backends
- Shows search results in a separate filtered view
- Highlights matches and supports color labels for interesting lines
- Opens archives, compressed files, and remote URLs
- Detects text encoding automatically
- Supports portable mode with settings stored next to the executable

## Downloads

The easiest way to get started is to download the latest release from the
[GitHub releases page](https://github.com/loseblue/loselog/releases/latest).

### Windows

- `loselog-*-x64-portable.zip`: unzip and run `loselog_portable.exe`
- Setup installer: run `loselog-*-setup.exe`

### Linux and macOS

Prebuilt packages are published on the releases page when available.
Otherwise, build from source using the instructions below.

## Usage

Run `loselog` from a terminal and optionally pass a file to open:

```sh
loselog path/to/logfile.log
```

See [DOCUMENTATION.md](DOCUMENTATION.md) for detailed usage, search patterns,
settings, and keyboard shortcuts.

## Building

Please see [BUILD.md](BUILD.md) for the supported build environment and
step-by-step instructions.

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md)
before opening issues or pull requests.

## License

Loselog is licensed under the GPL version 3 or later. See
[COPYING](COPYING) for the full license text.

## Credits

Loselog is maintained by [loseblue](https://github.com/loseblue) and is forked
from [klogg](https://github.com/variar/klogg).
