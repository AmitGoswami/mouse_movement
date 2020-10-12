@echo off
cls
set time_out=%1
set distance=%2
IF [%time_out%] EQU [] (
	echo Value Missing using default
	set time_out=10
)
IF [%distance%] EQU [] (
	echo distance Missing using default
	set distance=1
)
:move_mouse
echo moving mouse by %distance%x%distance%
mouse.exe moveBy %distance%x%distance%
timeout /t %time_out%
goto move_mouse