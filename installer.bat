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
    echo Automatic Temp Cleaner file has been successfully added to your system.
) else (
    echo File could not be created!
)
pause
