@echo off
setlocal

set "INI_FILE=config.ini"

REM Read IP value from the .ini file
for /f "usebackq tokens=2 delims==" %%I in (`findstr /C:"IP=" "%INI_FILE%"`) do (
    set "IP=%%I"
)

REM Read USB value from the .ini file
for /f "usebackq tokens=2 delims==" %%I in (`findstr /C:"Port=" "%INI_FILE%"`) do (
    set "USB=%%I"
)


REM Run the first command
.\MPS\MonitorSwitcher.exe -load:C:\Users\Morgan\AppData\Roaming\MonitorSwitcher\Profiles\vr.xml
.\USBIP\usbip.exe attach -r %IP% -b %USB%


REM Wait for 3 seconds
ping 127.0.0.1 -n 4 > nul

.\MPS\MonitorSwitcher.exe -load:C:\Users\Morgan\AppData\Roaming\MonitorSwitcher\Profiles\pc.xml
".\SteamVR.url"

endlocal