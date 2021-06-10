::Author: Lucas C. Jun 2021
::Description:
::Disables the J-Link EDU License Agreement Pop-Up.
::Updates the date in the J-Link settings Registry.
::Installation
::Use Windows Task Scheduler to run every day automatically at midnight or at login.

@echo off
::Generate new date value
set year=%date:~10,4%
set mon=%date:~4,2%
set day=%date:~7,2%
::Use PS to convert to hex and build date hex string
for /f %%i in ('powershell -command "'{0:x4}' -f" %year%') do set new=%%i
for /f %%i in ('powershell -command "'{0:x2}' -f" %mon%') do set new=%new%%%i
for /f %%i in ('powershell -command "'{0:x2}' -f" %day%') do set new=%new%%%i
::Replace old value with the new value
reg add "HKEY_CURRENT_USER\Software\SEGGER\J-Link" /f /v "LicenseEDU_DontShowAgainToday" /t REG_DWORD /d "0x%new%"