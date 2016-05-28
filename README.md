# KGE - Kuikka Game Enhancer
[![build status](https://gitlab.com/osasto-kuikka/kge/badges/master/build.svg)](https://gitlab.com/osasto-kuikka/kge/commits/master)


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
  - Modified ace3 spectator with support for KGE respawn
- Tank Recoil
  - When tank main cannon shoots, it shakes tank a litte
- Teamroster
  - Show full list of players in you team and their roles
- Teleport'
  - Allow admin to teleport player(s) to admin location or specific map position
- Zeus
  - Automatically create zeus module for every mission that admin can use

## Build
- Run makefile
   - Linux (or MinGW on windows): Run `make` on this folder
   - Windows: Double click make.bat

## Create release
- Linux (MinGW on windows)
  - `make release`
- Windows
  - no native way yet...
  

