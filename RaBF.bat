@echo off
title Raise a batched Floppa
color 60
mode con: cols=85 lines=20
set version=0.1.4

:mainmenu
SETLOCAL EnableDelayedExpansion
set /a SplashVar=%random% %%11
if !SplashVar! equ 0 (
    set SplashText=Terra JUST JOINED THE BATTLE
)
if !SplashVar!==1 (
    set SplashText=Created by GladfanIsHere!
)
if !SplashVar!==2 (
    set SplashText=Sissio also takes care of Floppa
)
if !SplashVar!==3 (
    set SplashText=Not made in Japan
)
if !SplashVar!==4 (
    set SplashText=Doesn't includes Bingus!!
)
if !SplashVar!==5 (
    set SplashText=Includes Floppa!!
)
if !SplashVar!==6 (
    set SplashText=Luxury cherries cost 20$?!
)
if !SplashVar!==7 (
    set SplashText=Did you know? Maharaja Cloudi loves RaBF!
)
if !SplashVar!==8 (
    set SplashText=Gladfan eats empanadas with Floppa
)
if !SplashVar!==9 (
    set SplashText=Almond water... good idea?
)
if !SplashVar!==10 (
    set SplashText=Sissio... is part of Cloudiland?
)



::Main menu related stuff
color 60
SETLOCAL EnableDelayedExpansion
cls
echo Raise a batched Floppa
echo.
echo !SplashText!
echo.
echo 1) Play
echo 2) Help
echo 3) Quit
echo.
echo Version: %version%
echo.
choice /c 123
   
if %errorlevel% equ 1 (
    goto startoptions
)
if %errorlevel% equ 2 (
    goto help
)
if %errorlevel% equ 3 (
    exit
)
pause

:help
cls
echo         Help
echo.
echo 1) Return
echo 2) Instructions
echo 3) Credits
echo.
echo.
choice /c 123
   
if %errorlevel% equ 1 (
    goto mainmenu
)
if %errorlevel% equ 2 (
    goto instructions
)
if %errorlevel% equ 3 (
    goto credits
)
pause

:instructions
cls
echo      Instructions
echo.
echo Raise your Floppa by taking care of him,
echo and some random events will happen
echo they may be good or bad!
echo Beat yourself with the "score" feature
echo Your best score will be saved so you
echo can beat it with no problem!
echo.
echo 1) Return
choice /c 1 /m "Return? "
   
if %errorlevel% equ 1 (
    goto help
)

:credits
cls
echo        Credits
echo *=-------------------=*
echo       Created by
echo      GladfanIsHere
echo      Contributors
echo      Sissiogamer1
echo *=-------------------=*
echo 1) Return
choice /c 1 /m "Return? "
   
if %errorlevel% equ 1 (
    goto help
)

:startoptions
color 60
cls
echo      Start Options
echo.
echo 1) New game
echo 2) Load game
echo 3) Delete slot
echo 4) Update slot [BETA]
echo 5) Return
echo.
echo.
choice /c 12345
   
if %errorlevel% equ 1 (
    goto newgame
)
if %errorlevel% equ 2 (
    goto loadgame
)
if %errorlevel% equ 3 (
    goto deletegame
)
if %errorlevel% equ 4 (
    goto updategame
)
if %errorlevel% equ 5 (
    goto mainmenu
)
pause

:: [BETA FUNCTION] Update a slot save file
:updategame
set selectedSlot=0
color e0
cls
echo      Game slots
echo.
echo 1) Slot 1
echo 2) Slot 2
echo 3) Slot 3
echo 4) Return
echo 5) Help
echo.
echo Select the slot you want to update, remember that this
echo feature is still in a BETA state and might not work properly,
echo expect data losses or corruptions. If you're new with the
echo Updating feature, you can get more information about it by
echo selecting "Help". 
echo.
choice /c 12345 /m "Which slot are you UPDATING? "
if %errorlevel% equ 1 (
    set selectedSlot=1
    goto updategameConfirmation
)
if %errorlevel% equ 2 (
    set selectedSlot=2
    goto updategameConfirmation
)
if %errorlevel% equ 3 (
    set selectedSlot=3
    goto updategameConfirmation
)
if %errorlevel% equ 4 (
    goto mainmenu
)
if %errorlevel% equ 5 (
    goto updategameHelp
)

::Help menu of the BETA update feature
:updategameHelp
cls
echo   Help with the Update feature
echo.
echo To update an old game slot, first you will need to copy
echo an old save slot that is atleast from version 0.1.3 from
echo their respective folder, you can find the slot folder in
echo the v0.1.3 folder at stats\slot[NUMBER of the slot you want to update]
echo then you copy the content of the folder and then you paste it
echo in the folder of this version at updateSlots\slot[NUMBER]
echo and finally, you select the slot where you pasted the content
echo in the update menu.
echo Note: The "Update feature" doesn't work with slots from 0.1 - 0.1.1
echo.
echo.
echo 1) Return
echo 2) Create extra-information txt file.
echo.
choice /c 12
if %errorlevel% equ 1 (
    goto updategame
)
if %errorlevel% equ 2 (
    (
        echo You can update slots from v0.1.2, but since those slots don't create any "configData.fdata" files,
        echo you will have to copy a "configData.fdata" file from a v0.1.3 slot and then paste it into the v0.1.2
        echo slot that you want to update, you just will have to change the "0.1.3" inside of the file to "0.1.2"
        echo and then just follow the instructions to update a slot. This WON'T WORK with 'slots' from version 0.1 - 0.1.1 because
        echo there were no slots on those versions, slots were added in version 0.1.2, so don't try to update 'slots' from v0.1 - 0.1.1
    )> Extra-Information.txt
    goto updategameHelp
)

::Confirmation screen
:updategameConfirmation
cls
echo.
echo Are you sure you want to UPDATE slot %selectedSlot%?
echo when the update process is done, the slot will be
echo saved in your slot %selectedSlot%, this cannot be undone.
echo.
echo               1. Yes 2. No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    if exist updateSlots\slot%selectedSlot%\inUse.fdata (
        (
            set /p slotVersion=
            set /p slotGamemode=
        )< updateSlots\slot%selectedSlot%\configData.fdata
        set selectedSlot=%selectedSlot%
        set version=%version%
        start update.bat
        exit
    ) else (
        cls
        echo.
        echo This slot does not have any saved data to update
        echo.
        echo Press any key to continue
        pause >nul
    )
)
if %errorlevel% equ 2 (
    goto updategame
)
goto updategame


::Delete a slot save file
:deletegame
set selectedSlot=0
color 4f
cls
echo      Game slots
echo.
echo 1) Slot 1
echo 2) Slot 2
echo 3) Slot 3
echo 4) Return
echo.
choice /c 1234 /m "Which slot are you DELETING? "
if %errorlevel% equ 1 (
    set selectedSlot=1
    goto deletegameConfirmation
)
if %errorlevel% equ 2 (
    set selectedSlot=2
    goto deletegameConfirmation
)
if %errorlevel% equ 3 (
    set selectedSlot=3
    goto deletegameConfirmation
)
if %errorlevel% equ 4 (
    goto mainmenu
)

:deletegameConfirmation
set deleteSlot=slot%selectedSlot%
cls
echo Are you sure that you want to delete
echo Slot %selectedSlot%'s saved data?
echo.
echo      This CANNOT be undone!
echo         1) Yes 2) No
echo.
choice /c 12
if %errorlevel% equ 1 (
    if exist stats\%deleteSlot%\inUse.fdata (
            del /Q stats\%deleteSlot%
            goto deletegame
    ) else (
        cls
        color c0
        echo.
        echo This slot does not have
        echo any saved data to delete
        echo.
        echo Press any key to continue
        pause >nul
        goto deletegame
    )
)
if %errorlevel% equ 2 (
    goto deletegame
)

::New "newgame" (Slot selector)
:newgame
set selectedSlot=0
color 60
cls
echo      Game slots
echo.
echo 1) Slot 1
echo 2) Slot 2
echo 3) Slot 3
echo 4) Return
echo.
choice /c 1234 /m "Which slot are you selecting? "
if %errorlevel% equ 1 (
    set selectedSlot=1
    goto newstartsettings
)
if %errorlevel% equ 2 (
    set selectedSlot=2
    goto newstartsettings
)
if %errorlevel% equ 3 (
    set selectedSlot=3
    goto newstartsettings
)
if %errorlevel% equ 4 (
    goto startoptions
)
:newstartsettings
cls
color 60
echo Slot%select% settings
echo.
echo 1) Return
echo 2) Game modes
echo 3) Start new game
echo.
echo.
choice /c 123
if %errorlevel% equ 1 (
    goto newgame
)
if %errorlevel% equ 2 (
    goto gamemodeSelect
)
if %errorlevel% equ 3 (
    if defined gamemodeS (
        goto newstart
    ) else (
        goto newstartsettings
    )
)

:gamemodeSelect
cls
echo       Game modes
echo.
echo 1. Return
echo 2. Normal mode
echo 3. Hard mode
echo.
choice /c 1234
if %errorlevel% equ 1 (
   goto newstartsettings
)

if %errorlevel% equ 2 (
   goto normalmode 
)

if %errorlevel% equ 3 (
   goto hardmode
)

:hardmode
cls
        echo      Hard mode
        echo.
        echo This is the hard mode,
        echo this mode is more challenging
        echo than the normal mode,
        echo recommended for experienced
        echo players that have played
        echo the normal mode
        echo.
        echo Difficulty: 7 / 7
        echo.
        echo 1. Select 2. Nah, another one
        echo.
        choice /c 12
        if %errorlevel% equ 1 (
            set gamemodeS=2
            goto newstartsettings
        )
        if %errorlevel% equ 2 (
            goto gamemodeSelect
        )
        goto gamemodeSelect

:normalmode
cls
        echo      Normal mode
        echo.
        echo This is the normal mode,
        echo it's recommended to play
        echo this mode first
        echo.
        echo Difficulty: 4 / 7
        echo.
        echo 1. Select 2. Nah, another one
        echo.
        choice /c 12
        if %errorlevel% equ 1 (
            set gamemodeS=1
            goto newstartsettings
        )
        if %errorlevel% equ 2 (
            goto gamemodeSelect
        )   

::New start (old :newgame)
:newstart
::-statsSlot
::Floppa Stats
set health=20
set fhunger=100
set fsanity=100
set fage=1
set factions=0
set fname=Floppa
::Game stats
set money=0
set score=0
set currentDM=None
::-invStatsSlot
set playerhasfood=0
set sanityPills=0
set milk=0
set birthdayCake=0
set mrbeastticket=0
set fopsoda=0
set tag=0
set gun=0
set hat=0
::-gameSettings
set version=0.1.3
set gamemode=%gamemodeS%
if %gamemode%==2 (
    set health=30
)
::End of "set" command
::-"Exporting" data
::Stats
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
    echo %gun%
    echo %hat%
)> stats/slot%selectedSlot%/data.fdata
::Best score
set bestscore=0
(
    echo %bestscore%
)> stats/bestSc.fdata
::Death messages
set dstarve=Your Floppa starved to death!
set dhealth1=Your Floppa health was not good... 
(
    echo %dstarve%
    echo %dhealth1%
)> stats/deathMessages.fdata

(
    echo Yes
)> stats/slot%selectedSlot%/inUse.fdata

(
    echo %version%
    echo %gamemode%
)> stats/slot%selectedSlot%/configData.fdata
goto loadgamestart



::New "loadgame" (Slot selector)
:loadgame
color 30
set selectedSlot=0
cls
echo    Load a Game slot
echo.
echo 1) Slot 1
echo 2) Slot 2
echo 3) Slot 3
echo 4) Return
echo.
choice /c 1234 /m "Which slot are you loading? "
if %errorlevel% equ 1 (
    set selectedSlot=1
    goto loadgamestart
)
if %errorlevel% equ 2 (
    set selectedSlot=2
    goto loadgamestart
)
if %errorlevel% equ 3 (
    set selectedSlot=3
    goto loadgamestart
)
if %errorlevel% equ 4 (
    goto startoptions
)


::Load the game (old :loadgame)
:loadgamestart
cls
if exist stats/slot%selectedSlot%/inUse.fdata (
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
    set /p gun=
    set /p hat=
)< stats/slot%selectedSlot%/data.fdata
    (
        set /p bestscore=
    )< stats/bestSc.fdata
    (
        set /p dstarve=
        set /p dhealth1=
    )< stats/deathMessages.fdata
    (
        set /p version=
        set /p gamemode=
    )< stats/slot%selectedSlot%/configData.fdata
    goto welcome
) else (
    cls
    color c0
    echo This slot has no saved data.
    pause
    goto startoptions
)
::Welcome message!!
:welcome
if %gamemode% equ 2 (
    call hardmode.bat (
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set fname=%fname%
set money=%money%
set score=%score%
set currentDM=%currentDM%
set playerhasfood=%playerhasfood%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set tag=%tag%
set bestscore=%bestscore%
set selectedSlot=%selectedSlot%
    )
)
color 0F
cls
echo       Welcome to
echo Raise a batched Floppa!
echo I hope you enjoy the game!
echo.
echo Floppa hunger = %fhunger%
echo Floppa sanity = %fsanity%
echo Floppa age = %fage%
echo Floppa health = %health%
echo Floppa name = %fname%
echo Your money = %money%$
echo Score = %score%
echo Best score = %bestscore%
echo.
echo These are the game stats

echo Press any key to continue
        pause >nul
goto game

::Game related stuff
:game
SETLOCAL DisableDelayedExpansion
set /a rnd1=%random% %%100
set /a rnd2=%random% %%5
cls
if %factions%==10 (
   set /a fage=%fage% + 1
   set factions=0
   echo %fname% age increased by 1
   echo and now it's %fage%!
)
if %health% GTR 20 (
    set health=20
)
if %fhunger% GTR 100 (
   set fhunger=100
)
if %fsanity% GTR 100 (
   set fsanity=100
)
if %fsanity% LSS 20 (
   set /a hunger=%hunger% - 10
   set /a health=%health% - 5
   echo due to %fname%'s sanity
   echo being less than 20 %fname%
   echo lost 10 hunger and 5 health!
)


if %rnd1%==86 (
    goto travcake
)
if %rnd1%==67 (
    goto travMrbtick
)
if %rnd1%==35 (
    goto travBandits
)
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %health% LEQ 0 (
    set health=0
    set currentDM=%dhealth1%
    goto gvsave1
)
if %fhunger% LEQ 0 (
    set fhunger=0
    set currentDM=%dstarve%
    goto gvsave1
)
if %hat% equ 1 (
    if %rnd2% equ 3 (
         set /a money=%money% + 5
         echo %fname%'s dripness gave you 5 more money.
         echo My money is now %money%$
         echo.
    )
)
set /a score=%fhunger% + %fsanity% * %fage% + %money% / 3
color 0F
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo.
echo 1) Pet
echo 2) Full bowl
echo 3) Item shop
echo 4) Items
echo 5) Save game (-1 Health)
echo 6) Go to main menu
echo.
echo Health=%health%
echo Score=%score%
echo.

choice /c 123456 /m "What do you want to do?"

if %errorlevel% equ 1 (
    goto pet
)
if %errorlevel% equ 2 (
    goto fullbowl
)
if %errorlevel% equ 3 (
    goto shopC0
)
if %errorlevel% equ 4 (
    goto items
)
if %errorlevel% equ 5 (
    goto save2
)
if %errorlevel% equ 6 (
    goto mainmenu
)

:pet
cls
set /a rnd=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%10
set /a rndb2=%random% %%10
set /a rndc=%random% %%30
set /a rndd=%random% %%20
echo You petted %fname% and it dropped %rnd%$
echo %fname% recovered %rndb% sanity and got %rnd%$!
set /a money=%money% + %rnd%
set /a fsanity=%fsanity% + %rndb%
echo My money is now %money%$
echo %fname%'s sanity is now %fsanity%
if %rnda%==0 (
    echo Press any key to continue
        pause >nul
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb2%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb2%
    set /a fsanity=%fsanity% - %rndc%
    echo [!] %fname%'s sanity has decreased by %rndd%
)

echo Press any key to continue
        pause >nul
goto save

echo Press any key to continue
        pause >nul
set /a factions=%factions% + 1
goto save

:fullbowl
cls
set /a rnd1=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%9
set /a rndc=%random% %%10
if %playerhasfood%==0 (
   echo You don't have food to full the bowl
   if %rnda%==0 (
echo Press any key to continue
        pause >nul
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [I] %fname%'s hunger has decreased %rndb%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [I] %fname%'s hunger has decreased by %rndb%
    set /a fsanity=%fsanity% - %rndc%
    echo [I] %fname%'s sanity has decreased by %rndc%
)
   echo Press any key to continue
        pause >nul
   goto save
)
if %playerhasfood%==1 (
   echo You filled %fname%'s bowl
   echo and he ate it... %fname% recovered %rnd1% hunger
   set /a fhunger=%fhunger% + %rnd1%
   set playerhasfood=0
   echo Press any key to continue
        pause >nul
   set /a factions=%factions% + 1
   goto save
)

:item
cls
color d0

::Shop related stuff here !!
:shopC0
cls
color 1F
set product=None
echo Miscellaneous Shop
echo *=-------------------=*
echo N) Next shop category
echo R) Return
echo 1) Food (47$)
echo 2) Sanity pills (230$)
echo 3) Milk (87$)
echo 4) Birthday cake (673$)
echo 5) Fop Soda (30$)
echo 6) Tag (500$)
echo *=-------------------=*
echo.
set /p playerInput="What do you want to buy? "
if "%playerInput%"=="N" (
    goto shopC1
)

if "%playerInput%"=="R" (
    goto game
)
if "%playerInput%"=="n" (
    goto shopC1
)

if "%playerInput%"=="r" (
    goto game
)

::Food
if %playerInput% equ 1 (
    if %playerhasfood%==1 (
        cls
        color 4f
        echo You already have food.
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    if %playerhasfood%==0 (
        if %money% GEQ 47 (
        cls
        color a0
        echo You bought the item "Food", now you can
        echo fill %fname%'s bowl!
        set playerhasfood=1
        set /a money=%money% - 47
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 47 (
        cls
        echo You don't have enough money
        echo to buy the item "Food"!
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    )
        
)
::Sanity pills
if %playerInput% equ 2 (
    if %sanityPills%==1 (
        cls
        color 4f
        echo You already have Sanity pills.
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    if %sanityPills%==0 (
        if %money% GEQ 230 (
        cls
        color a0
        echo You bought the item "Sanity pills", now you can
        echo give them to %fname% to increase his sanity
        set sanityPills=1
        set /a money=%money% - 230
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 230 (
        cls
        echo You don't have enough money
        echo to buy the item "Sanity pills"!
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    )
)
::Milk
if %playerInput% equ 3 (
    if %milk%==1 (
        cls
        color 4f
        echo You already have Milk.
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    if %milk%==0 (
        if %money% GEQ 87 (
        cls
        color a0
        echo You bought the item "Milk", this works like Food
        echo but it can make %fname% to recover up to 60
        echo hunger instead of 30!
        set milk=1
        set /a money=%money% - 87
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 87 (
        cls
        echo You don't have enough money
        echo to buy the item "Milk"!
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    )
)
::Birthday cake
if %playerInput% equ 4 (
    if %birthdayCake%==1 (
        cls
        color 4f
        echo You already have a Birthday cake.
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    if %birthdayCake%==0 (
        if %money% GEQ 673 (
        cls
        color a0
        echo You bought the "Birthday cake", this will make
        echo %fname% age 2 years, it also will be able
        echo to recover 67 hunger.
        set birthdayCake=1
        set /a money=%money% - 673
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 673 (
        cls
        echo You don't have enough money
        echo to buy the "Birthday cake"!
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    )
)
::Fop soda
if %playerInput% equ 5 (
    if %fopsoda%==1 (
        cls
        color 4f
        echo You already have a Fop Soda.
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    if %fopsoda%==0 (
        if %money% GEQ 30 (
        cls
        color a0
        echo You bought the "Fop Soda", this will heal
        echo            %fname% by 5
        set fopsoda=1
        set /a money=%money% - 30
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 30 (
        cls
        echo You don't have enough money
        echo to buy the "Fop Soda"!
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    )
)
::Tag
if %playerInput% equ 6 (
    if %tag%==1 (
        cls
        color 4f
        echo You already have a Tag.
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    if %tag%==0 (
        if %money% GEQ 500 (
        cls
        color a0
        echo You bought the "Tag", now you can
        echo rename %fname% to whatever you want!
        set tag=1
        set /a money=%money% - 500
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 500 (
        cls
        echo You don't have enough money
        echo to buy the "Tag"!
        echo Press any key to continue
        pause >nul
        goto shopC0
    )
    )
)
goto shopC0

::Shop category 1, WEAPONS
:shopC1
cls
color 5F
set product=None
echo Weapons Shop
echo *=-------------------=*
echo N) Next page
echo R) Return
echo 1) Gun (200$)
echo *=-------------------=*
echo.
set /p playerInput="What do you want to buy? "

if "%playerInput%"=="N" (
    goto shopC2
)

if "%playerInput%"=="R" (
    goto game
)

if "%playerInput%"=="n" (
    goto shopC2
)

if "%playerInput%"=="r" (
    goto game
)

::Gun
if %playerInput% equ 1 (
    if %gun%==1 (
        cls
        color 4f
        echo You already have a Gun.
        echo Press any key to continue
        pause >nul
        goto shopC1
    )
    if %gun%==0 (
        if %money% GEQ 200 (
        cls
        color a0
        echo You bought the "Gun", now %fname%
        echo can defend himself
        set gun=1
        set /a money=%money% - 200
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 200 (
        cls
        echo You don't have enough money
        echo to buy the "Gun"!
        echo Press any key to continue
        pause >nul
        goto shopC1
    )
    )
)

goto shopC1

::Shop category 2, FAZBOOK MERKETPLEZ
:shopC2
cls
color 70
set product=None
echo Fazbook Merketplez
echo *=-------------------=*
echo N) Next page
echo R) Return
echo 1) Hat (200$)
echo *=-------------------=*
echo.
set /p playerInput="What do you want to buy? "

if "%playerInput%"=="N" (
    goto shopC0
)

if "%playerInput%"=="R" (
    goto game
)

if "%playerInput%"=="n" (
    goto shopC0
)

if "%playerInput%"=="r" (
    goto game
)

::Hat
if %playerInput% equ 1 (
    if %hat%==1 (
        cls
        color 4f
        echo You already have a Hat.
        echo Press any key to continue
        pause >nul
        goto shopC2
    )
    if %hat%==0 (
        if %money% GEQ 200 (
        cls
        color a0
        echo You bought the "Hat", now %fname%
        echo can have the drip :drip:
        set hat=1
        set /a money=%money% - 200
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 200 (
        cls
        echo You don't have enough money
        echo to buy the "Hat"!
        echo Press any key to continue
        pause >nul
        goto shopC2
    )
    )
)

goto shopC2


::Items select menu

:items
set /a rndBeast=%random% %%1500
set /a rnd2=%random% %%30
cls
echo        Items
echo.
echo 1) Return
echo 2) Sanity pills
echo 3) Milk
echo 4) Birthday Cake
echo 5) Mr.Beast event ticket
echo 6) Fop Soda
echo 7) Tag
echo.
echo        Stats
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo       Health=%health%
echo.

choice /c 1234567
if %errorlevel% equ 1 (
    goto game
)
::Sanity pills
if %errorlevel% equ 2 (
    if %sanityPills%==1 (
        cls
        echo You gave %fname% the
        echo "Sanity pills" and he ate them,
        echo He recovered 58 of his sanity!
        set /a fsanity=%fsanity% + 58
        set /a factions=%factions% + 1
        set sanityPills=0
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %sanityPills%==0 (
        cls
        echo You don't have any "Sanity Pills"!
        echo Press any key to continue
        pause >nul
        goto items
    )
)
::Milk
if %errorlevel% equ 3 (
    if %milk%==1 (
        cls
        echo You gave %fname% the Milk
        echo and he drank it... %fname%
        echo recovered %rnd2% hunger
        set /a fhunger=%fhunger% + %rnd2%
        set /a factions=%factions% + 1
        set milk=0
        echo Press any key to continue
        pause >nul
        set /a factions=%factions% + 1
        goto save
    )
    if %milk%==0 (
        cls
        echo You don't have "Milk"!
        echo Press any key to continue
        pause >nul
        goto items
    )
)
::Birthday cake
if %errorlevel% equ 4 (
    if %birthdayCake%==1 (
        cls
        echo You gave %fname% the Birthday
        echo cake and sing happy birthday two
        echo times in a row, this made %fname%
        echo age 2 years, an also made him to 
        echo recover 67 hunger!
        set /a fhunger=%fhunger% + 67
        set /a factions=%factions% + 1
        set birthdayCake=0
        echo Press any key to continue
        pause >nul
        set /a fage=%fage% + 2
        goto save
    )
    if %birthdayCake%==0 (
        cls
        echo You don't have a "Birthday cake"!
        echo Press any key to continue
        pause >nul
        goto items
    )
)
::Mr beast ticket
if %errorlevel% equ 5 (
    if %mrbeastticket%==1 (
        cls
        echo You sent %fname% to a Mr.Beast event,
        echo and he won %rndBeast%$, got %rndBeast%$
        set /a money=%money% + %rndBeast%
        set /a factions=%factions% + 1
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %mrbeastticket%==0 (
        cls
        echo You don't have a Ticket for the Mr.Beast event
        echo Press any key to continue
        pause >nul
        goto items
    )
)
::Fop Soda
if %errorlevel% equ 6 (
    if %fopsoda%==1 (
        cls
        echo You gave %fname% the Fop Soda
        echo and he drank it, %fname% healed
        echo            5 health
        set /a health=%health% + 5
        set /a factions=%factions% + 1
        set fopsoda=0
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %fopsoda%==0 (
        cls
        echo You don't have a Fop Soda
        echo Press any key to continue
        pause >nul
        goto items
    )
)

::Tag (Rename item)
if %errorlevel% equ 7 (
    if %tag%==1 (
        goto nameTagFloppa
    )
    if %tag%==0 (
        cls
        echo You don't have a Tag
        echo Press any key to continue
        pause >nul
        goto items
    )
)
:nameTagFloppa
        cls
        echo You decided to rename your Floppa
        echo by using the Tag, how do you want
        echo          to call him?
        echo *=------------------------------=*
        echo Please don't use spaces or unicode
        echo characters or the game could crash
        echo.
        set /p nameInput="Your Floppa new name > "
        set fname=%nameInput%
        echo Press any key to continue
        pause >nul
        cls
        if %fname%==Sissiogamer1 (
            echo Sissiogamer1, a pretty good dude.
            echo.
        )
        if %fname%==GladfanIsHere (
            echo GladfanIsHere, the creator of this game...
            echo.
        )
        if %fname%==Terra (
            echo Terra: HE'S TRYING TO KILL ME
            echo.
        )
        echo You changed your Floppa name to
        echo %fname% !
        set tag=0
        set /a factions=%factions% + 1
        echo Press any key to continue
        pause >nul
        goto save

::Events
:travBandits
set /a damageBandits=%random% %%10
color b0
cls
echo Someone knocked at your door,
echo      Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    if %gun% equ 1 (
        echo [I] Some bandits entered into your house, but
        echo %fname% used the gun to fight with the bandits   
        echo      The bandits left your house...
        echo -1 Gun
        echo.
        set gun=0
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %gun% equ 0 (
        echo [I] Some bandits entered into your house and
        echo         and hurted %fname!
        echo %fname% lost %damageBandits% health...
        set /a health=%health% - %damageBandits%
        echo.
        echo Press any key to continue
        pause >nul
        goto save
    )
)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        echo Press any key to continue
        pause >nul
        goto save
)

:travMrbtick
color b0
cls
echo Someone knocked at your door,
echo      Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo A traveller steped into your house and
    echo  is selling you a ticket for the
    echo    Mr.Beast event for only 700$
    echo        Would you accept it?
    echo.
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 700 (
            cls
            echo You accepted the traveller's offer and
            echo bought the ticket for the Mr.Beast event,
            echo you can use it to make %fname% go to
            echo  a Mr.Beast event and win up to 1500$
            set /a money=%money% - 700
            set mrbeastticket=1
            echo Press any key to continue
        pause >nul
            goto save
        )
        if %money% LSS 700 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye fella!"
            echo Press any key to continue
        pause >nul
            goto save
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        echo Press any key to continue
        pause >nul
        goto save
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        echo Press any key to continue
        pause >nul
        goto save
)
::Birthday cake traveller offer
:travcake
color b0
cls
echo Someone knocked at your door,
echo Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo A traveller steped into your house and
    echo is selling you a Birthday Cake for only
    echo     437$, Would you accept it?
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 437 (
            cls
            echo You accepted the traveller's offer and
            echo bought the Birthday Cake, you can use it to
            echo   age %fname% by 2 and sing to him
            echo   happy birthday two times in a row
            echo      and recover him 67 hunger
            set /a money=%money% - 437
            set birthdayCake=1
            echo Press any key to continue
        pause >nul
            goto save
        )
        if %money% LSS 437 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye baka!"
            echo Press any key to continue
        pause >nul
            goto save
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        echo Press any key to continue
        pause >nul
        goto save
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        echo Press any key to continue
        pause >nul
        goto save
)

::Game over!
:gameover
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %fhunger% LEQ 0 (
    set fhunger=0
)
cls
if %score% GTR %bestscore% (
    set bestscore=%score%
    echo       New best!
) else (
    echo.
)
color c0
echo       GAME OVER!
echo.
echo %currentDM%
echo.
echo        Stats:
echo   Floppa age = %fage%
echo  Floppa sanity = %fsanity%
echo  Floppa hunger = %fhunger%
echo  Floppa health = %health%
echo Floppa name = %fname%
echo     Score = %score%
echo  Best score = %bestscore%
echo.
echo 1) Go to main menu
echo 2) Start a new game 
echo.
choice /c 12
if %errorlevel% equ 1 (
    set savebcdir=mainmenu
    goto savebc
)
if %errorlevel% equ 2 (
    set savebcdir=newgame
    goto savebc
)

::Save system related stuff
:savebc
set bestscore=%bestscore%
(
    echo %bestscore%
)> stats/bestSc.fdata

goto %savebcdir%

:save
cls

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
echo %gun%
echo %hat%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> stats/bestSc.fdata

goto game

:save2
cls
set /a health=%health% - 1
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
echo %gun%
echo %hat%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> stats/bestSc.fdata
color 2f

echo The game was saved correctly!

echo Press any key to continue
        pause >nul
goto game

:gvsave1
cls

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
echo %gun%
echo %hat%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> stats/bestSc.fdata
goto gameover
