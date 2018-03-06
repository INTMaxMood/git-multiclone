# gitpunk

## Releases

|            **STABLE RELEASE**            |           **TESTING RELEASE**            |
| :--------------------------------------: | :--------------------------------------: |
| [![](https://img.shields.io/badge/Branch-master-green.svg)]() | [![](https://img.shields.io/badge/Branch-testing-orange.svg)]() |
| [![](https://img.shields.io/badge/Version-v1.0.0-lightgrey.svg)]() | [![](https://img.shields.io/badge/Version-v1.0.0-lightgrey.svg)]() |
| [![Build Status](https://travis-ci.org/trimstray/gitpunk.svg?branch=master)](https://travis-ci.org/trimstray/gitpunk) | [![Build Status](https://travis-ci.org/trimstray/gitpunk.svg?branch=testing)](https://travis-ci.org/trimstray/gitpunk) |

## Description

It allows you to clone the repositories (normal repository or marked as a star) of the given user from github.

[![asciicast](https://asciinema.org/a/tgq2eKpfaNxJLVI2BKkm5eeHH.png)](https://asciinema.org/a/tgq2eKpfaNxJLVI2BKkm5eeHH)

## Parameters

Provides the following options:

``````
  Usage:
    gitpunk <option|long-option>

  Examples:
    gitpunk --help

  Options:
        --help                      show this message
        --select-all                select all available repositories
        --tor <port_number>         set the tor port number
``````

## Requirements

**<u>Gitpunk</u>** uses external utilities to be installed before running:

- [mktemp](https://www.mktemp.org/manual.html)
- [dialog](http://linuxcommand.org/lc3_adv_dialog.php)
- [git](https://git-scm.com/)
- [curl](https://curl.haxx.se/docs/manpage.html)
- [tor](https://www.torproject.org/index.html.en)

## Install/uninstall

It's simple - for install:

``````
./setup.sh install
``````

For remove:

``````
./setup.sh uninstall
``````

> * symlink to `bin/gitpunk` is placed in `/usr/local/bin`
> * man page is placed in `/usr/local/man/man8`

## Use example

Then an example of starting the tool:

``````
./bin/gitpunk
``````

> If you want to use a connection via the tor network, use the `--tor` parameter and set the port number as the value.

## Logging

After running the script, the `log/` directory is created and in it the following files with logs:

* `<script_name>.<date>.log` - all `_logger()` function calls are saved in it
* `stdout.log` - a standard output and errors from the `_init_cmd()` function are written in it. If you want to redirect the output from command, use the following structure: `your_command >>"$_log_stdout" 2>&1 &`

## Limitations

The main limit is the maximum number of requests allowed by the github service from one IP address (this limit is canceled after a given time). If you want to check the values:

```bash
curl -Iks https://api.github.com/ | grep "X-RateLimit.*:" 
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 17
X-RateLimit-Reset: 1520291624
```

Of course, one way to circumvent this limitation is to use the connection through the network nodes of the tor.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Project architecture

    |-- LICENSE.md                 # GNU GENERAL PUBLIC LICENSE, Version 3, 29 June 2007
    |-- README.md                  # this simple documentation
    |-- CONTRIBUTING.md            # principles of project support
    |-- .gitignore                 # ignore untracked files
    |-- .travis.yml                # continuous integration with Travis CI
    |-- setup.sh                   # install gitpunk on the system
    |-- bin
        |-- gitpunk                # main script (init)
    |-- doc                        # includes documentation, images and manuals
        |-- man8
            |-- gitpunk.8          # man page for gitpunk
    |-- lib                        # libraries, external functions
    |-- log                        # contains logs, created after init
    |-- src                        # includes external project files
        |-- helpers                # contains core functions
        |-- import                 # appends the contents of the lib directory
        |-- __init__               # contains the __main__ function
        |-- settings               # contains gitpunk settings
    |-- tmp                        # contains temporary files (mktemp)

## License

GPLv3 : <http://www.gnu.org/licenses/>

**Free software, Yeah!**
