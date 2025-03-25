@echo off
net session >nul 2>&1 || (
    echo This file needs to be run with administrator privileges.
    pause
    exit /b
)
set "fileName=temp-cleaner.bat"
set "destination=%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"

echo rd %%temp%% /s /q > "%fileName%"
echo md %%temp%% >> "%fileName%"

if exist "%fileName%" (
    move "%fileName%" "%destination%"
    echo .bat file has been successfully created and moved.
) else (
    echo File could not be created!
)
pause
