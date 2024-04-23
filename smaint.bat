@echo off
title System Maintenance Utility v2.4 2024/03/20
color 0b
cls

echo System Maintenance Utility starting
echo System Maintenance Utility starting >> C:\Maintenance.log
@echo on
REM Starting System Maintenance Utility...
@echo off
color 0a
echo . >> C:\Maintenance.log
date /t  >> C:\Maintenance.log
echo %time% >> C:\Maintenance.log

echo System Maintenance Utility reset network >> C:\Maintenance.log
@echo on
REM Resetting network settings...
@echo off
ipconfig /release >> C:\Maintenance.log & ipconfig /renew & ipconfig /flushdns & ipconfig /registerdns & netsh winsock reset catalog & netsh int ipv4 reset reset.log & netsh int ip reset & netsh int ip set dns & netsh winsock reset 
netsh interface set interface name="LAN0" admin=disable
netsh interface set interface name="WLAN0" admin=disable
netsh interface set interface name="WLAN1" admin=disable
netsh interface set interface name="WLAN2" admin=disable

echo System Maintenance Utility stopping services >> C:\Maintenance.log
@echo on
REM Stopping critical services...
@echo off

:: List of services to stop
for %%x in (
    ServiceName "Another Service Name"
) do (
    sc stop %%x >> C:\Maintenance.log
)

echo System Maintenance Utility killing processes >> C:\Maintenance.log
@echo on
REM Killing unnecessary processes...
@echo off

:: List of processes to kill
for %%y in (
    explorer.exe process.exe "some process.exe"
) do (
    taskkill /im "%%y" /f >> C:\Maintenance.log
)

echo System Maintenance Utility deleting temp files >> C:\Maintenance.log
@echo on
REM Deleting temporary files...

@echo off
:: Commands to delete temporary files
echo y | del C:\Windows\System32\spool\PRINTERS\*.* /s /f /q
mkdir C:\rtemp
copy C:\windows\Prefetch\ReadyBoot C:\rtemp
echo y | del C:\Windows\Prefetch\*.* /s /f /q
copy C:\rtemp\ReadyBoot C:\Windows\Prefetch\
rmdir C:\rtemp\ /s /q
echo y | del C:\Windows\Temp\*.* /s /f /q
echo y | del %userprofile%\AppData\Local\Mozilla\Firefox\Profiles\*.* /s /f /q
echo y | del %userprofile%\AppData\Local\Temp\*.* /s /f /q
echo y | del %userprofile%\AppData\Local\CrashDumps\*.* /s /f /q
attrib -s -h %userprofile%\appdata\local\iconcache.db
echo y | del /f %userprofile%\AppData\Local\IconCache.db
rmdir %userprofile%\AppData\Local\Temp\ /s /q

echo System Maintenance Utility restoring network >> C:\Maintenance.log
REM Restoring network interfaces...
@echo off
netsh interface set interface name="LAN0" admin=enable
netsh interface set interface name="WLAN0" admin=enable
netsh interface set interface name="WLAN1" admin=enable
netsh interface set interface name="WLAN2" admin=enable

sc start Netman
sc start LanmanServer
sc start LanmanWorkstation
sc start Dhcp
sc start Dnscache
sc start Browser
sc start WinHttpAutoProxySvc
sc start SessionEnv

@echo off
echo.
echo *** Restarting GPU  
timeout /t 2 /nobreak >nul
devmanview.exe /disable_enable "NVIDIA GeForce GTX 970" 
echo. 

echo System Maintenance Utility restarting other programs >> C:\Maintenance.log
@echo on
REM Restarting other programs that were closed before...
@echo off
sc start UxSms
sc start VMnetDHCP
sc start VMAuthdService
sc start "VMware NAT Service"
sc start "VMUSBArbService"
sc start WSearch
sc start Spooler
start "" "C:\Another Program\somewhere\application.exe"

echo System Maintenance Utility starting desktop >> C:\Maintenance.log
@echo on
REM Starting desktop...
@echo off
start explorer.exe
start explorer.exe
startrdpclip.exe
@echo on
echo System Maintenance Utility complete >> C:\Maintenance.log
REM Maintenance complete...
@echo off
echo >> C:\Maintenance.log
