<p align="center">
    <img src="https://raw.githubusercontent.com/osasto-kuikka/KGE/master/extras/logo.svg" width="480">
</p>

<p align="center">
    <a href="https://github.com/osasto-kuikka/KGE/releases/latest">
        <img src="https://img.shields.io/badge/Version-1.0.6-blue.svg?style=flat-square" alt="KGE Version">
    </a>
    <a href="https://github.com/osasto-kuikka/KGE/issues">
        <img src="https://img.shields.io/github/issues-raw/osasto-kuikka/KGE.svg?style=flat-square&label=Issues" alt="KGE Issues">
    </a>
    <a href="https://github.com/osasto-kuikka/KGE/releases">
        <img src="https://img.shields.io/github/downloads/osasto-kuikka/KGE/total.svg?style=flat-square&label=Downloads" alt="KGE Downloads">
    </a>
    <a href="https://github.com/osasto-kuikka/KGE/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/License-GPLv2-red.svg?style=flat-square" alt="KGE License">
    </a>
    <a href="https://travis-ci.org/osasto-kuikka/KGE">
        <img src="https://img.shields.io/travis/osasto-kuikka/KGE.svg?style=flat-square&label=Build" alt="KGE Build Status">
    </a>
</p>

<p align="center">
    <sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a> and <a href="">ACE3</a></strong></sup>
</p>

## Description
Kuikka Game Enhancer also known as KGE is small script package that was created for Osasto Kuikka to allow things that other mods didn't offer like admin respawn.

## Features
- Autorun
  - Pressing autorun key (default: ctrl + c) makes player run automatically
- Bloodmist
  - Small bloodcloud when person is hit
- Clearchat
  - Make chat window a bit clearer to read
- Gear
  - Show group gear on start
- Respawn
  - Allow admin to respawn units when it best suits the current mission
- Spectator
  - Support for ACE3 spectator with KGE respawn
- Tank Recoil
  - When tank main cannon shoots, it shakes tank a litte
- Teamroster
  - Show full list of players in you team and their roles
- Teleport'
  - Allow admin to teleport player(s) to admin location or specific map position
- Zeus
  - Automatically create zeus module for every mission that admin can use

## Building KGE

### Windows

On Windows, you can use the make.bat file for creating a simple build of all PBOs using the packaged version of armake.

If you want more advanced features like only rebuilding changed addons or automated release packaging, you'll have to aquire `make` for Windows or use a Linux environment on Windows such as Cygwin or the Windows Subsystem for Linux in Windows 10 and then simply follow the Linux instructions.

### Linux

On Linux, you'll have to acquire armake from the appropriate source for your distribution. Check the [armake repository](https://github.com/KoffeinFlummi/armake) for instructions for your distribution. Example for Ubuntu:

```sh
$ sudo add-apt-repository ppa:koffeinflummi/armake
$ sudo apt-get update
$ sudo apt-get install armake
```

Then, simply navigate to the KGE project directory and run `$ make`

Other make targets include:

- `$ make signatures` - Creates a signed build.
- `$ make release` - Creates a signed build and packages it into a zip file ready for release.
- `$ make filepatching` - Creates a build usable for filepatching.

## File Patching

File Patching allows you to change the files in an addon while the game is running, requiring only a restart of the mission. This makes it great for debugging, as it cuts down the time required between tests. Note that this only works with PBOs created using `$ make filepatching`.

For file patching to work, you need a symbolic link from "[Arma 3 installation folder]/z/kge" to your KGE project folder. To do this on Windows and Linux respectively, run these commands:

```sh
$ # Windows
$ mkdir "[Arma 3 installation folder]\z"
$ mklink /J "[Arma 3 installation folder]\z\kge" "[location of the KGE project]"

$ # Linux
$ mkdir "[Arma 3 installation folder]/z"
$ ln -s "[Arma 3 installation folder]/z/kge" "[location of the KGE project]"
```

### Disabling CBA Function Caching

By default CBA caches a compiled version of functions to reduce mission load times. This interferes with file patching. There are three ways to disable function caching:

- Load `cba_cache_disable.pbo` (included in CBA's optional folder)
- Add the following to your test missions description.ext:

```cpp
class CfgSettings {
    class CBA {
        class Caching {
            compile = 0;
            xeh = 0;
            functions = 0;
        };
    };
};
```

- To only disable caching for a single module, hence greatly improving mission restart time, add the following line to the `script_component.hpp` file of said module:

```cpp
#define DISABLE_COMPILE_CACHE
```

### Running Arma 3 with File Patching Enabled

Starting from version 1.50, Arma 3 was changed to disable file patching by default, making the feature opt-in. To execute the game with file patching enabled add the `-filePatching` flag to the command line.

### Restrictions of File Patching

If you need to add/remove files, then you'll need to run `$ make filepatching` again without the game running, and restart. That is all that is required to add new files to then further use in testing.

