@echo off
echo Loading Minecraftstad libraries...
timeout /NOBREAK 5 > nul
@echo on
IF EXIST "data" goto cont
goto new

:new
@echo off
cls
echo Welcome to %product%! This is your first time running the server.
timeout /NOBREAK 5 > nul
goto check

:check
cls
echo We will now check to see if craftbukkit can be found.
echo (BE SURE THAT THE SERVER's .jar NAME IS zbukkit.jar!)
IF EXIST "zbukkit.jar" goto contnew
echo We are sorry, but zbukkit.jar is non-existant. We will recheck again in 10 seconds.
timeout /NOBREAK 10 > nul
goto check2

:check2
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
echo If the error continues to occur, contact tbonedylan@gmail.com. Thank you!
pause
exit /b %erre%

:contnew
cls
echo OK! Your server basics have been setup!
title SETUP
echo %random%%random%%random% > data
goto cont

:cont
set ver=1.0.0
set product=Minecraftstad: A Bukkit Windows Launcher
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
timeout /NOBREAK 5 > nul
cls
echo %product% Version %ver%
title %prodshort% vs. %ver% -- Loading up...
timeout /NOBREAK 5 > nul
cls
goto main
:main
echo. >> MinecraftstadLog.txt
echo Minecraftstad Log -- Created on %date% at %time%. >> MinecraftstadLog.txt
echo Minecraftstad is running normally on %date% @ %time%. >> MinecraftstadLog.txt
cls
title %prodshort% vs. %version% -- Running
echo Running %prodshort% Version %version%...
color 3f
echo Minecraftstad has initialized Java @ %time% on %date% successfully. >> MinecraftstadLog.txt
Java -Xms1098M -Xmx1098M -XX:MaxPermSize=128M -jar zbukkit.jar
title Minecraftstad -- Stopped/Crashed
echo Minecraftstad has either crashed or a server operator has stopped the server! Rebooting...
echo Press Ctrl+C to stop the reinitalization of your minecraft server.
timeout 10 > nul
goto main
