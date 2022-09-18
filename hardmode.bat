@echo off
title Raise a batched Floppa HARD MODE
color 60
mode con: cols=50 lines=20


::Welcome message!!
:welcome
color 0F
cls
echo    Welcome back to         
echo Raise a batched Floppa HARD MODE
echo This is a more challenging mode
echo.
echo Floppa hunger = %fhunger%
echo Floppa sanity = %fsanity%
echo Floppa age = %fage%
echo Floppa health=%health%
echo Floppa name=%fname%
echo Your money = %money%$
echo Score = %score%
echo Best score = %bestscore%
echo.
echo These are the game stats,
echo enjoy taking care of your
echo Floppa on HARD MODE!
echo Press any key to continue
        pause >nul
goto game

::Game related stuff
:game
set /a rnd1=%random% %%100
set /a rnd2=%random% %%10
cls
if %factions%==10 (
   set /a fage=%fage% + 1
   set factions=0
   echo %fname% age increased by 1
   echo and now it's %fage%!
)
if %health% GTR 30 (
    set health=30
)
if %fhunger% GTR 100 (
   set fhunger=100
)
if %fsanity% GTR 100 (
   set fsanity=100
)
if %fsanity% LSS 60 (
   set /a hunger=%hunger% - 20
   set /a health=%health% - 10
   echo due to %fname%'s sanity
   echo being less than 60 %fname%
   echo lost 20 hunger and 10 health!
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
    if %rnd2% equ 6 (
         set /a money=%money% + 15
         echo %fname%'s dripness gave you 15 more money.
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
echo 3) Buy something
echo 4) Items
echo 5) Save game (-3 Health)
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
    goto shop
)
if %errorlevel% equ 4 (
    goto items
)
if %errorlevel% equ 5 (
    goto save2
)
if %errorlevel% equ 6 (
    call RaBF.bat
)

:pet
cls
set /a rnd=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%10
set /a rndb2=%random% %%25
set /a rndc=%random% %%30
set /a rndd=%random% %%28
echo You petted %fname% and it dropped %rnd%
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

:fullbowl
cls
set /a rnd1=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%23
set /a rndc=%random% %%27
if %playerhasfood%==0 (
   echo [!] You don't have food to full the bowl
   if %rnda%==0 (
echo Press any key to continue
        pause >nul
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased %rndb%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb%
    set /a fsanity=%fsanity% - %rndc%
    echo [!] %fname%'s sanity has decreased by %rndc%
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
   pause
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
echo 1) Food (64$)
echo 2) Sanity pills (300$)
echo 3) Milk (97$)
echo 4) Birthday cake (713$)
echo 5) Fop Soda (43$)
echo 6) Tag (600$)
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
        if %money% GEQ 64 (
        cls
        color a0
        echo You bought the item "Food", now you can
        echo fill %fname%'s bowl!
        set playerhasfood=1
        set /a money=%money% - 64
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 64 (
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
        if %money% GEQ 300 (
        cls
        color a0
        echo You bought the item "Sanity pills", now you can
        echo give them to %fname% to increase his sanity
        set sanityPills=1
        set /a money=%money% - 300
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 300 (
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
        if %money% GEQ 97 (
        cls
        color a0
        echo You bought the item "Milk", this works like Food
        echo but it can make %fname% to recover up to 60
        echo hunger instead of 30!
        set milk=1
        set /a money=%money% - 97
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 97 (
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
        if %money% GEQ 713 (
        cls
        color a0
        echo You bought the "Birthday cake", this will make
        echo %fname% age 2 years, it also will be able
        echo to recover 67 hunger.
        set birthdayCake=1
        set /a money=%money% - 713
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 713 (
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
        if %money% GEQ 43 (
        cls
        color a0
        echo You bought the "Fop Soda", this will heal
        echo            %fname% by 5
        set fopsoda=1
        set /a money=%money% - 43
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 43 (
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
        if %money% GEQ 600 (
        cls
        color a0
        echo You bought the "Tag", now you can
        echo rename %fname% to whatever you want!
        set tag=1
        set /a money=%money% - 600
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 600 (
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
echo 1) Gun (235$)
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
        if %money% GEQ 235 (
        cls
        color a0
        echo You bought the "Gun", now %fname%
        echo can defend himself
        set gun=1
        set /a money=%money% - 235
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 235 (
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
color 5F
set product=None
echo Fazbook Merketplez
echo *=-------------------=*
echo N) Next page
echo R) Return
echo 1) Hat (300$)
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
        if %money% GEQ 300 (
        cls
        color a0
        echo You bought the "Hat", now %fname%
        echo can have the drip :drip:
        set hat=1
        set /a money=%money% - 300
        echo Press any key to continue
        pause >nul
        goto save
    )
    if %money% LSS 300 (
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
echo 8) Hat
echo.
echo        Stats
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo       Health=%health%
echo.

choice /c 12345678
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
            set /a factions=%factions% + 1
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
            echo   age %fname% by 2 and sing him
            echo   happy birthday two times in a row
            echo      and recover him 67 hunger
            set /a money=%money% - 437
            set /a factions=%factions% +1
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
echo     Score = %score%
echo  Best score = %bestscore%
echo.
echo 1) Go to main menu
echo.
choice /c 1
if %errorlevel% equ 1 (
    goto savebc
)

::Save system related stuff
:savebc
set bestscore=%bestscore%
(
    echo %bestscore%
)> stats/bestSc.fdata
call RaBF

:save
cls

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %money%
echo %playerhasfood%
echo %score%
echo %currentDM%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> stats/bestSc.fdata

goto game

:save2
cls
set /a health=%health% - 3

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %money%
echo %playerhasfood%
echo %score%
echo %currentDM%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> stats/bestSc.fdata

color 2f
echo The game was saved correctly!

pause
goto game

:gvsave1
cls

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %money%
echo %playerhasfood%
echo %score%
echo %currentDM%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> stats/bestSc.fdata
goto gameover
