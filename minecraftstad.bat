@echo off
echo Loading Minecraftstad libraries...
timeout /NOBREAK 5 > nul
@echo on
set product=Minecraftstad: A Bukkit Windows Launcher
set ver=1.0.0
IF EXIST "data" goto cont
goto new

:new
set lst=new
@echo off
cls
echo Welcome to %product%! This is your first time running the server.
title %product%
timeout /NOBREAK 5 > nul
goto check

:check
set lst=check
cls
echo We will now check to see if craftbukkit can be found.
echo (BE SURE THAT THE SERVER's .jar NAME IS zbukkit.jar!)
IF EXIST "zbukkit.jar" goto contnew
echo We are sorry, but zbukkit.jar is non-existant. We will recheck again in 10 seconds.
timeout /NOBREAK 10 > nul
goto check2

:check2
set lst=check2
cls
echo RECHECKING...
IF NOT EXIST "zbukkit.jar" set err=1 (FileNotFound) & set erre=1 & goto error
goto contnew

:error
cls
color fc
echo Minecraftstad has encountered an error!
echo The error has left this code: %err%
echo The error has, additionally, left a possible trace of itself! The possible directory of the file which caused the error is %CD%.
echo Possible thread: %lst%
echo If the error continues to occur, contact tbonedylan@gmail.com. Thank you!
pause
exit /b %erre%

:contnew
set lst=contnew
cls
echo OK! Your server basics have been setup!
title SETUP
echo %random%%random%%random% > data
goto cont

:cont
set debugname=Minecraftstad-Spigot
set debugger=ZDebug
set debuggerver=1.0.0
set author=Thomas D. Streiff
set supauth=(None)
set adebug=Thomas D. Streiff
set engauthor=Spigot
set engtype=Custom-Craftbukkit
set prodshort=Minecraftstad
@echo off
timeout /NOBREAK 5 > nul
cls
echo Done!
IF NOT EXIST "pref.zp" echo Please take a second... & set /p abc="Enter mode argument (Default: w) " & echo %abc%>pref.zp
cls
IF EXIST "pref.zp" set /p marg=<pref.zp
echo Current mode argument: %marg%
if "%marg%"=="" del pref.zp & timeout /NOBREAK 5 > nul & goto cont
if "%marg%"=="i" echo Current mode will show information messages or higher.
if "%marg%"=="w" echo Current mode will show warning messages or higher.
if "%marg%"=="c" echo Current mode will only show Critical messages.
if "%marg%"=="d" echo Current mode will show all messages.
timeout /NOBREAK 5 > nul
cls
echo %product% Version %ver%
title %prodshort% vs. %ver% -- Loading up...
if "%marg%"=="d" goto debug
if "%marg%"=="c" goto critical
if "%marg%"=="i" goto info
if "%marg%"=="m" adfsad
timeout /NOBREAK 5 > nul
cls
goto main
:main
echo. >> MinecraftstadLog.txt
echo Minecraftstad Log -- Created on %date% at %time%. >> MinecraftstadLog.txt
echo Minecraftstad is running normally on %date% @ %time%. >> MinecraftstadLog.txt
cls
title %prodshort% vs. %ver% -- Running
echo Running %prodshort% Version %version%...
color 3f
echo Minecraftstad has initialized Java @ %time% on %date% successfully. >> MinecraftstadLog.txt
Java -Xms1098M -Xmx1098M -XX:MaxPermSize=128M -jar zbukkit.jar
title Minecraftstad -- Stopped/Crashed
echo Minecraftstad has either crashed or a server operator has stopped the server! Rebooting...
echo Press Ctrl+C to stop the reinitalization of your minecraft server.
timeout 10 > nul
goto main
