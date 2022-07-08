@echo off
title Raise a batched Floppa (RaBF)
color 60
mode con: cols=50 lines=20

::Main menu related stuff
:mainmenu
color 60
cls
echo Raise a batched Floppa!
echo         Version
echo          0.1.1
echo -----------------------
echo 1) Play
echo 2) Help
echo 3) Quit
echo -----------------------
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
echo -----------------------
echo 1) Return
echo 2) Instructions
echo 3) Credits
echo -----------------------
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
echo -----------------------
echo In this game you'll have to
echo raise a Floppa, similar to
echo it's roblox game, but made in
echo batch, here you can't move so
echo you'll have to select choices!
echo Can you beat yourself raising
echo Floppa?
echo -----------------------
echo 1) Return
choice /c 1 /m "Return? "
   
if %errorlevel% equ 1 (
    goto help
)

:credits
cls
echo        Credits
echo -----------------------
echo       Created by
echo      GladfanIsHere
echo    Load game bug fix
echo      Sissiogamer1
echo -----------------------
echo 1) Return
choice /c 1 /m "Return? "
   
if %errorlevel% equ 1 (
    goto help
)

:startoptions
cls
echo      Start Options
echo -----------------------
echo 1) New game
echo 2) Load game
echo 3) Return
echo -----------------------
echo.
choice /c 123
   
if %errorlevel% equ 1 (
    goto newgame
)
if %errorlevel% equ 2 (
    goto loadgame
)
if %errorlevel% equ 3 (
    goto mainmenu
)
pause

:newgame
cls
set fhunger=100
set fsanity=100
set fage=1
set factions=0
(
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
)> stats/foppastats.txt
set money=0
set playerhasfood=0
(
echo %money%
echo %playerhasfood%
)> stats/gamestats.txt
::player inventory stats
set sanityPills=0
set milk=0
set birthdayCake=0
set cellphone=0
set foppaFren=0
(
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %cellphone%
echo %foppaFren%
)> invStats/invstats.txt
pause
goto loadgame
::Load the game
:loadgame
cls
if exist stats/foppastats.txt (
    (
    set /p fhunger=
    set /p fsanity=
    set /p fage=
    set /p factions=
)< stats/foppastats.txt
(
    set /p money=
    set /p playerhasfood=
)< stats/gamestats.txt
(
    set /p sanityPills=
    set /p milk=
    set /p birthdayCake=
    set /p cellphone=
    set /p foppaFren=
)< invStats/invstats.txt
goto welcome
) else (
    cls
    color c0
    echo You didn't start any game yet.
    pause
    goto startoptions
)
::Welcome message!!
:welcome
color 0F
cls
echo        Welcome
echo          to
echo Raise a batched Floppa!
echo I hope you enjoy the game!
echo -----------------------
echo Floppa hunger = %fhunger%
echo Floppa sanity = %fsanity%
echo Floppa age = %fage%
echo Your money = %money%$
echo -----------------------
echo These are the game stats

pause
goto game

::Game related stuff
:game
set /a rnd1=%random% %%100
cls
if %factions%==10 (
   set /a fage=%fage% + 1
   set factions=0
   echo Your Floppa age increased by 1
   echo and now it's %fage%!
)
if %fhunger% GTR 100 (
   set fhunger=100
)
if %fsanity% GTR 100 (
   set fsanity=100
)
if %fhunger% LSS 1 (
   goto gameover
)
if %fsanity% LSS 20 (
   set /a hunger=%hunger% - 10
   echo due to your Floppa's sanity
   echo being less than 20 your Floppa
   echo lost 10 hunger!
)


if %rnd1%==86 (
    goto travcake
)
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %fhunger% LEQ 0 (
    set fhunger=0
)
if %foppaFren%==1 (
    if %factions% equ 3 (
        echo Your friend payed the rent
        echo  Got 100$ from the rent
        set /a money=%money% + 100
    )
    if %factions% equ 6 (
       echo Your friend payed the rent
        echo  Got 100$ from the rent
        set /a money=%money% + 100
    )
    if %factions% equ 9 (
        echo Your friend payed the rent
        echo  Got 100$ from the rent
        set /a money=%money% + 100
    )
) 
if %foppaFren%==0 (
    set foppaFren=0
)
cls
color 0F
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo -----------------------
echo 1) Pet
echo 2) Full bowl
echo 3) Buy something
echo 4) Items
echo 5) Save game
echo 6) Go to main menu
echo -----------------------
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
    goto save
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
echo You petted your Floppa and it dropped %rnd%
echo Your Floppa recovered %rndb% sanity and got %rnd%$!
set /a money=%money% + %rnd%
set /a fsanity=%fsanity% + %rndb%
echo My money is now %money%
echo Your Floppa's sanity is now %fsanity%
if %rnda%==0 (
    pause
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!]Your Floppa's hunger has decreased by %rndb2%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!]Your Floppa's hunger has decreased by %rndb2%
    set /a fsanity=%fsanity% - %rndc%
    echo [!]Your Floppa's sanity has decreased by %rndd%
)

pause
goto save

pause
set /a factions=%factions% + 1
goto save

:fullbowl
cls
set /a rnd1=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%9
set /a rndc=%random% %%10
if %playerhasfood%==0 (
   echo [!]You don't have food to full the bowl!
   if %rnda%==0 (
pause
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!]Your Floppa's hunger has decreased %rndb%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!]Your Floppa's hunger has decreased by %rndb%
    set /a fsanity=%fsanity% - %rndc%
    echo [!]Your Floppa's sanity has decreased by %rndc%
)
   pause
   goto save
)
if %playerhasfood%==1 (
   echo You filled your Floppa's bowl
   echo and he ate it... Your Floppa recovered %rnd1% hunger
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
:shop
cls
color 1F
set product=None
echo                   Shop
echo --------------------------------------------
echo 1) Return
echo 2) Food (47$)
echo 3) Sanity pills (300$)
echo 4) Milk (87$)
echo 5) Birthday cake (673$)
echo --------------------------------------------
echo (Once you've selected something 
echo it will buy automatically
echo without any confirmation screen,
echo if you have the required
echo money, obviously)
echo.
choice /c 12345 /m "What do you want buy? "
if %errorlevel% equ 1 (
    goto game
)
::Food
if %errorlevel% equ 2 (
    if %playerhasfood%==1 (
        cls
        color 4f
        echo [!]You already have food.
        pause
        goto shop
    )
    if %playerhasfood%==0 (
        if %money% GEQ 47 (
        cls
        color a0
        echo You bought the item "Food", now you can
        echo fill your Floppa bowl!
        set playerhasfood=1
        set /a money=%money% - 47
        pause
        goto save
    )
    if %money% LSS 47 (
        cls
        echo You don't have enough money
        echo to buy the item "Food"!
        pause
        goto shop
    )
    )
        
)
::Sanity pills
if %errorlevel% equ 3 (
    if %sanityPills%==1 (
        cls
        color 4f
        echo [!]You already have Sanity pills.
        pause
        goto shop
    )
    if %sanityPills%==0 (
        if %money% GEQ 300 (
        cls
        color a0
        echo You bought the item "Sanity pills", now you can
        echo give them to your Floppa to increase his sanity
        set sanityPills=1
        set /a money=%money% - 300
        pause
        goto save
    )
    if %money% LSS 300 (
        cls
        echo You don't have enough money
        echo to buy the item "Sanity pills"!
        pause
        goto shop
    )
    )
)
::Milk
if %errorlevel% equ 4 (
    if %milk%==1 (
        cls
        color 4f
        echo [!]You already have Milk.
        pause
        goto shop
    )
    if %milk%==0 (
        if %money% GEQ 87 (
        cls
        color a0
        echo You bought the item "Milk", this works like Food
        echo but it can make your Floppa to recover up to 60
        echo hunger instead of 30!
        set milk=1
        set /a money=%money% - 87
        pause
        goto save
    )
    if %money% LSS 87 (
        cls
        echo You don't have enough money
        echo to buy the item "Milk"!
        pause
        goto shop
    )
    )
)
::Birthday cake
if %errorlevel% equ 5 (
    if %birthdayCake%==1 (
        cls
        color 4f
        echo [!]You already have a Birthday cake.
        pause
        goto shop
    )
    if %birthdayCake%==0 (
        if %money% GEQ 673 (
        cls
        color a0
        echo You bought the "Birthday cake", this will make
        echo your Floppa age 2 years, it also will be able
        echo to recover 67 hunger.
        set birthdayCake=1
        set /a money=%money% - 673
        pause
        goto save
    )
    if %money% LSS 673 (
        cls
        echo You don't have enough money
        echo to buy the "Birthday cake"!
        pause
        goto shop
    )
    )
)
goto shop

::Items select menu

:items
set /a rnd2=%random% %%30
cls
echo        Items
echo -----------------------
echo 1) Return
echo 2) Sanity pills
echo 3) Milk
echo 4) Birthday Cake
echo -----------------------
echo        Stats
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo.

choice /c 1234
if %errorlevel% equ 1 (
    goto game
)
::Sanity pills
if %errorlevel% equ 2 (
    if %sanityPills%==1 (
        cls
        echo You gave your Floppa the
        echo "Sanity pills" and he ate them,
        echo He recovered 58 of his sanity!
        set /a fsanity=%fsanity% + 58
        set sanityPills=0
        pause
        goto save
    )
    if %sanityPills%==0 (
        cls
        echo You don't have any "Sanity Pills"!
        pause
        goto items
    )
)
::Milk
if %errorlevel% equ 3 (
    if %milk%==1 (
        cls
        echo You gave your Floppa the Milk
        echo and he drank it... Your Floppa
        echo recovered %rnd2% hunger
        set /a fhunger=%fhunger% + %rnd2%
        set milk=0
        pause
        set /a factions=%factions% + 1
        goto save
    )
    if %milk%==0 (
        cls
        echo You don't have "Milk"!
        pause
        goto items
    )
)
::Birthday cake
if %errorlevel% equ 4 (
    if %birthdayCake%==1 (
        cls
        echo You gave your Floppa the Birthday
        echo cake and sing happy birthday two
        echo times in a row, this made your Floppa
        echo age 2 years, an also made him to 
        echo recover 67 hunger!
        set /a fhunger=%fhunger% + 67
        set birthdayCake=0
        pause
        set /a fage=%fage% + 2
        goto save
    )
    if %birthdayCake%==0 (
        cls
        echo You don't have a "Birthday cake"!
        pause
        goto items
    )
)
::Cellphone
if %errorlevel% equ 5 (
    if %cellphone%==1 (
        cls
        echo You called a roommate to stay in
        echo your house, his rent will be 100$
        echo every day that passes he'll pay you
        echo             the rent!
        pause
        set foppaFren=1
        goto save
    )
    if %cellphone%==0 (
        cls
        echo You don't have a "Cellphone"!
        pause
        goto items
    )
)

::Events

:travPhone
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
    echo  is selling you a Cellphone for only
    echo     400$, Would you accept it?
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 400 (
            cls
            echo You accepted the traveller's offer and
            echo bought the Cellphone, you can use it to
            echo call a roommate to stay in your house and
            echo beg him to give you the rent for every day
            echo that passes.
            set /a money=%money% - 400
            set cellphone=1
            pause
            goto save
        )
        if %money% LSS 400 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye fella!"
            pause
            goto save
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        pause
        goto save
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
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
            echo   age your Floppa by 2 and sing him
            echo   happy birthday two times in a row
            echo      and recover him 67 hunger
            set /a money=%money% - 437
            set birthdayCake=1
            pause
            goto save
        )
        if %money% LSS 437 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye baka!"
            pause
            goto save
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        pause
        goto save
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
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
color c0
echo       GAME OVER!
echo        Reason:
echo Your Floppa starved to
echo        death! 
echo -----------------------
echo        Stats:
echo   Floppa age = %fage%
echo  Floppa sanity = %fsanity%
echo  Floppa hunger = %fhunger%
echo -----------------------
echo 1) Go to main menu
echo 2) Start a new game
echo.
choice /c 12
if %errorlevel% equ 1 (
    goto mainmenu
)
if %errorlevel% equ 2 (
    goto newgame
)


::Save system related stuff
:save
cls
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
(
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
)> stats/foppastats.txt
set money=%money%
set playerhasfood=%playerhasfood%
(
echo %money%
echo %playerhasfood%
)> stats/gamestats.txt
::player inventory stats
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set cellphone=%cellphone%
set foppaFren=%foppaFren%
(
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %cellphone%
echo %foppaFren%
)> invStats/invstats.txt

goto game


