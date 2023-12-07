REM A code to delete and recreate shortcuts to project files (ipj) in the inventor project folder
REM Just insert the path of a folder containing your projects and to your inventor project folder path and run this script as an administrator

REM Written by Sebastian G., sebiscodes@gmail.com, 07. Dec. 2023, Winterthur
REM https://github.com/SebisCodes/CMDScripts

REM !!! IMPORTANT !!! START IT AS AN ADMINISTRATOR !!!

@echo off
set source_folder=*Path to the folder containing all .ipj files (project files)*
set target_folder=*Path to the inventor project folder (to create the .lnk files (shortcuts))*

del "%target_folder%\*.lnk"

setlocal enabledelayedexpansion
for /r %source_folder% %%i in (*.ipj) do (
  echo Creating link: "!target_folder!\%%~ni.lnk"
  mklink "!target_folder!\%%~ni.lnk" "%%i"
)
endlocal
