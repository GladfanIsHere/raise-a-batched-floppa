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
echo           0.1
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
set foppaFren=0
(
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %foppaFren%
)> invStats/invstats.txt

goto loadgame

:loadgame
cls
cd stats
if exist foppastats.txt (
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
) else (
    cls
    color c0
    echo You didn't started any games yet.
    pause
    goto mainmenu
)

::Game related stuff
:game
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
if %fsanity% LSS 1 (
   set /a hunger=%hunger% - 10
   echo due to your Floppa's sanity
   echo being less than 10 your Floppa
   echo lost 10 hunger!
)
color 0F
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo -----------------------
echo 1) Pet
echo 2) Full bowl
echo 3) Buy something
echo 4) Go to main menu
echo -----------------------
echo.

choice /c 1234 /m "What do you want to do?"

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
    goto mainmenu
)

:pet
cls
set /a rnd=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%9
set /a rndc=%random% %%10
echo You pet your Floppa!
echo It dropped %rnd%$ and Your Floppa recovered 2 sanity
set /a money=%money% + %rnd%
set /a fsanity=%fsanity% + 2
echo got %rnd%$! My money is now %money%
echo Your Floppa's sanity is now %fsanity%
if %rnda%==0 (
    pause
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!]Your Floppa's hunger has decreased by %rndb%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!]Your Floppa's hunger has decreased by %rndb%
    set /a fsanity=%fsanity% - %rndc%
    echo [!]Your Floppa's sanity has decreased by %rndc%
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


:shop
cls
color 10
set product=None
echo eichttps:/reasonable-prices-shop.sissi.foppa
echo --------------------------------------------
echo 1) Return
echo 2) Food (47$)
echo 3) Sanity pills (100$)
echo --------------------------------------------
echo (Once you've selected something 
echo it will buy automatically
echo without any confirmation screen,
echo if you have the required
echo money, obviously)
echo.
choice /c 123
if %errorlevel% equ 1 (
    goto game
)
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
if %errorlevel% equ 3 (
    if %money% GEQ 100 (
        cls
        color a0
        echo You bought the item "Sanity pills"
        echo you gave them to your Floppa
        echo he recovered 27 sanity!
        set /a fsanity=%fsanity% + 27
        set /a money=%money% - 100
        pause
        goto save
    )
    if %money% LSS 100 (
        cls
        echo You don't have enough money
        echo to buy the item "Sanity pills"!
        pause
        goto shop
    )
)
goto shop

::Events

::Game over!
:gameover
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
set foppaFren=%foppaFren%
(
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %foppaFren%
)> invStats/invstats.txt

goto game

