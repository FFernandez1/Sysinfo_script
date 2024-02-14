@echo off
setlocal

set "outputFolder=%USERPROFILE%\Desktop\system_info"
set "outputFile=%outputFolder%\system_info.txt"

if not exist "%outputFolder%" mkdir "%outputFolder%" | echo Folder does not exist,creating folder: %outputFolder%
if exist "%outputFile%" del "%outputFile%"

:: Output system information
systeminfo > "%outputFile%"


:: Retrieve Mozilla Firefox version 
for /f "tokens=3" %%k in ('reg query "HKLM\SOFTWARE\mozilla.org\Mozilla" /v CurrentVersion 2^>nul ^| findstr /i "CurrentVersion"') do (
    echo Firefox Version: %%k >> "%outputFile%"
)


:: Retrieve Chrome version 
for /f "tokens=3" %%i in ('reg query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome" /v DisplayVersion 2^>nul ^| findstr /i "DisplayVersion"') do (
    echo Chrome Version: %%i >> "%outputFile%"
)

:: Retrieve Brave version 
for /f "tokens=3" %%j in ('reg query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\BraveSoftware Brave-Browser" /v DisplayVersion 2^>nul ^| findstr /i "DisplayVersion"') do (
    echo Brave Version: %%j >> "%outputFile%"
)


echo ...
echo File generated: "%outputFile%"
echo ...

PAUSE







