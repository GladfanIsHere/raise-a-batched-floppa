@echo off
color F0 & title Updating a RABF slot...
if %slotGamemode% equ 1 (
   set slotGamemodeDisplay=Normal
)
if %slotGamemode% equ 2 (
   set slotGamemodeDisplay=Hard
)

::The update menu that appears when update.bat is opened
:updateMenu
cls
echo.
echo Information about slot %selectedSlot%
echo Slot version: v%slotVersion%
echo Slot game mode: %slotGamemodeDisplay%
echo.
echo Press any key to update
echo.
pause >nul
goto updateCheck

::This will check the configData.fdata file first
:updateCheck
cls
if "%slotVersion%"=="%version%" (
   echo.
   echo Sorry, but you can't update a slot that
   echo is already up to date
   echo.
   echo Press any key to open RaBF
   pause >nul
   start RaBF.bat
   exit
) else (
   goto loadUpdate
)

::This will load the slot
:loadUpdate
echo Loading slot's data...
echo Please wait a moment
timeout /t 1 /nobreak > nul
if "%slotVersion%"=="0.1.3" (
(
    set /p health=
    set /p fhunger=
    set /p fsanity=
    set /p fage=
    set /p factions=
    set /p fname=
    set /p money=
    set /p score= 
    set /p currentDM=
    set /p playerhasfood=
    set /p sanityPills=
    set /p milk=
    set /p birthdayCake=
    set /p mrbeastticket=
    set /p fopsoda=
    set /p tag=
)< updateSlots/slot%selectedSlot%/data.fdata
(
    set /p version=
    set /p gamemode=
)< updateSlots/slot%selectedSlot%/configData.fdata
goto update
)
if "%slotVersion%"=="0.1.2" (
(
    set /p health=
    set /p fhunger=
    set /p fsanity=
    set /p fage=
    set /p factions=
    set /p money=
    set /p score= 
    set /p currentDM=
    set /p playerhasfood=
    set /p sanityPills=
    set /p milk=
    set /p birthdayCake=
)< updateSlots/slot%selectedSlot%/data.fdata
(
    set /p version=
    set /p gamemode=
)< updateSlots/slot%selectedSlot%/configData.fdata
goto update
)
goto updateError

::This is the update process
:update
cls
echo Updating slot's data...
echo Please wait a moment
timeout /t 1 /nobreak > nul
if "%slotVersion%"=="0.1.3" (
   (
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %fname%
echo %money%
echo %score%
echo %currentDM%
echo %playerhasfood%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
echo %tag%
echo 0
echo 0
)> stats/slot%selectedSlot%/data.fdata
   (
    echo 0.1.4
    echo %slotGamemode%
   )> stats\slot%selectedSlot%\configData.fdata
   (
    echo Yes
)> stats/slot%selectedSlot%/inUse.fdata

   del /Q updateSlots\slot%selectedSlot%
   goto updateSucc
)
if "%slotVersion%"=="0.1.2" (
   (
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo Floppa
echo %money%
echo %score%
echo %currentDM%
echo %playerhasfood%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo 0
echo 0
echo 0
echo 0
echo 0
)> stats/slot%selectedSlot%/data.fdata
   (
    echo 0.1.4
    echo %slotGamemode%
   )> stats\slot%selectedSlot%\configData.fdata
   (
    echo Yes
)> stats/slot%selectedSlot%/inUse.fdata

   del /Q updateSlots\slot%selectedSlot%
   goto updateSucc
)
goto updateError

::If the updating process was successful
:updateSucc
color a0
cls
echo.
echo The updating process was done successfully,
echo the updated slot was saved in your slot %selectedSlot%
echo.
echo Press any key to open RaBF
pause >nul
start RaBF.bat
exit

::If the updating progress went wrong
:updateError
color c0
cls
echo.
echo An error ocurred in the updating process, please
echo try updating slot %selectedSlot% again, if it keeps showing
echo this error several times, the data of slot %selectedSlot% might be corrupted.
echo.
echo Press any key to open RaBF
pause >nul
start RaBF.bat
exit
