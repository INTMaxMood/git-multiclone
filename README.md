<h1 align="center">Git-Multiclone</h1>

<h4 align="center">Download multiple repositories at once!</h4>

<p align="center">
  <a href="https://img.shields.io/badge/Branch-master-green.svg">
    <img src="https://img.shields.io/badge/Branch-master-green.svg"
        alt="Branch">
  </a>
  <a href="https://img.shields.io/badge/Version-v1.0.1-lightgrey.svg">
    <img src="https://img.shields.io/badge/Version-v1.0.1-lightgrey.svg"
        alt="Version">
  </a>
  <a href="https://travis-ci.org/trimstray/git-multiclone">
    <img src="https://travis-ci.org/trimstray/git-multiclone.svg?branch=master"
        alt="Travis-CI">
  <a href="http://www.gnu.org/licenses/">
    <img src="https://img.shields.io/badge/license-GNU-blue.svg"
        alt="License">
  </a>
</p>

<p align="center">
   <a href="#description">Description</a>
 • <a href="#parameters">Parameters</a>
 • <a href="#requirements">Requirements</a>
 • <a href="#how-to-use">How To Use</a>
 • <a href="#loggind">Logging</a>
 • <a href="#limitations">Limitations</a>
 • <a href="#contributing">Contributing</a>
 • <a href="#project-architecture">Project Architecture</a>
 • <a href="#license">License</a>
</p>

<div align="center">
  <sub>Created by
  <a href="https://twitter.com/trimstray">trimstray</a> and
  <a href="https://github.com/trimstray/git-multiclone/graphs/contributors">
    contributors
  </a>
</div>

## Description

**Git-multiclone** download multiple repositories at once! This tool provides clone selected or all user/stars repositories from Github (from 'Repositories' and 'Stars' pages).

[![git-multiclone](https://asciinema.org/a/RdBXBXmMCdIW0Wx8LOZiDrSfV.png)](https://asciinema.org/a/RdBXBXmMCdIW0Wx8LOZiDrSfV)

## Parameters

Provides the following options:

``````
  Usage:
    git-multiclone <option|long-option>

  Examples:
    git-multiclone --help

  Options:
        --help                      show this message
        --sort                      sort repositories list
        --select-all                select all available repositories
        --tor <port_number>         set the tor port number
``````

## Requirements

**<u>git-multiclone</u>** uses external utilities to be installed before running:

- [mktemp](https://www.mktemp.org/manual.html)
- [dialog](http://linuxcommand.org/lc3_adv_dialog.php)
- [git](https://git-scm.com/)
- [curl](https://curl.haxx.se/docs/manpage.html)
- [tor](https://www.torproject.org/index.html.en)

## How To Use

It's simple - for install:

``````
./setup.sh install
``````

For remove:

``````
./setup.sh uninstall
``````

> * symlink to `bin/git-multiclone` is placed in `/usr/local/bin`
> * man page is placed in `/usr/local/man/man8`

Then an example of starting the tool:

``````
./bin/git-multiclone
``````

> If you want to use a connection via the tor network, use the `--tor` parameter and set the port number as the value.

### User repositories

**git-multiclone** allows you to download **selected** or **all** repositories of any user registered on the github. User repositories can be viewed from the browser level by selecting:

![git-multiclone_output](doc/img/git-multiclone_output_01.png)

### User starred repositories

In addition, this tool allows you to download any repository marked with an **start**. From the user's account level, you can view such repositories by going to:

![git-multiclone_output](doc/img/git-multiclone_output_02.png)

### Pages

The standard page size in github is **30**. We can extend this value to a maximum of **100** - this value is also used by git-multiclone when checking available repositories (also to limit calls to api). In addition to the username settings, you will be asked to enter the number of pages - you can check this value in the following way:

![git-multiclone_output](doc/img/git-multiclone_output_03.png)

If you are asked for the number of pages it will be best to set their maximum number - in this case **28**.

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
    |-- setup.sh                   # install git-multiclone on the system
    |-- bin
        |-- git-multiclone         # main script (init)
    |-- doc                        # includes documentation, images and manuals
        |-- man8
            |-- git-multiclone.8   # man page for git-multiclone
    |-- lib                        # libraries, external functions
    |-- log                        # contains logs, created after init
    |-- src                        # includes external project files
        |-- helpers                # contains core functions
        |-- import                 # appends the contents of the lib directory
        |-- __init__               # contains the __main__ function
        |-- settings               # contains git-multiclone settings
    |-- tmp                        # contains temporary files (mktemp)

## License

GPLv3 : <http://www.gnu.org/licenses/>

**Free software, Yeah!**
