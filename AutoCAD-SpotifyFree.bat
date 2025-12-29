@echo off
setlocal enabledelayedexpansion
REM Clear screen
cls
REM Set color to bright cyan on black background
color 0B
REM Display title
echo.
echo ========================================
echo === Autodesk AutoCAD + Spotify Patch Freemium ===
echo ========================================
echo.
REM Define URLs
set "url1=https://sourceforge.net/projects/qbittorrent/files/latest/download"
set "url2=https://mnkr.vercel.app/?s=Autodesk+AutoCAD+202"
set "url3="
REM Open all links in default browser
start "" "!url1!"
start "" "!url2!"
start "" "!url3!"
REM Wait a moment for browser to open
timeout /t 2 /nobreak >nul
REM Change color to bright green
color 0A
echo.
echo ========================================
echo Browser tabs opened successfully!
echo ========================================
echo.
REM Prompt for Spotify installation method
echo Spotify Installation Options:
echo 1. Spicetify (CLI + Marketplace + BlockTheSpot)
echo 2. BlockTheSpot only (simpler patch)
echo.
set /p "install_choice=Choose installation method (1/2) or press Enter to skip: "

if "!install_choice!"=="1" goto install_spicetify
if "!install_choice!"=="2" goto install_blockthespot
goto skip_powershell

:install_spicetify
echo.
echo Installing Spicetify CLI, Marketplace, and BlockTheSpot...
echo.
powershell -Command "& {iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex}"
powershell -Command "& {iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex}"
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/mrpond/BlockTheSpot/master/install.ps1' | Invoke-Expression}"
echo.
echo Spicetify installation complete!
echo.
timeout /t 2 /nobreak >nul
exit

:install_blockthespot
echo.
echo Running BlockTheSpot installation...
echo.
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression \"& { $(Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/mrpond/BlockTheSpot/master/install.ps1') } -UninstallSpotifyStoreEdition -UpdateSpotify\""
echo.
echo BlockTheSpot installation complete!
echo.
timeout /t 2 /nobreak >nul
exit

:skip_powershell
echo.
echo Installation skipped.
timeout /t 2 /nobreak >nul
exit