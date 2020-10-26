@echo off
:: time in seconds
set timeToWait=60

:: time in 24 hrs format
set activeTime=9
set sleepingTime=22

:startMouseMovement
  goto checkTime


:checkTime
  echo checking time
  echo current time is %time%
  :: if time is less than 9 AM, please wait and dont move the mouse
  if %time:~0,2% lss %activeTime% (
    goto wait
  ) 
  :: if time is less than 19(7 PM), please wait and dont move the mouse
  if %time:~0,2% geq %sleepingTime% (
    goto wait
  )
  :: if time if greater than 9 AM, move the mouse so that monitor doesnt sleep
  if %time:~0,2% geq %activeTime% (
    goto moveMouse
	goto wait
  )
  

:moveMouse
  echo 'moving mouse'
  mouse.exe moveBy 1x1
  goto wait
  

:wait
  timeout /t %timeToWait%
  goto startMouseMovement
