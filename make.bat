@echo off
setlocal enabledelayedexpansion

if not exist "@kge" mkdir "@kge"
if not exist "@kge\addons" mkdir "@kge\addons"
if not exist "@kge\optionals" mkdir "@kge\optionals"

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set armake=tools\armake_w64.exe) else (set armake=tools\armake_w32.exe)

for /d %%f in (addons\*) do (
    set folder=%%f
    set name=!folder:addons\=!
    echo   PBO  @kge\addons\kge_!name!.pbo
    !armake! build -w unquoted-string -f !folder! @kge\addons\kge_!name!.pbo
)

for /d %%f in (optionals\*) do (
    set folder=%%f
    set name=!folder:optionals\=!
    echo   PBO  @kge\optionals\kge_!name!.pbo
    !armake! build -w unquoted-string -f !folder! @kge\optionals\kge_!name!.pbo
)

pause
