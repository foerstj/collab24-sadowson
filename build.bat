:: name of map
set map=collab_project
:: name of map, case-sensitive
set map_cs=Collab 24 Sadowson
:: tank properties
set year=2024
set copyright=CC-BY-SA %year%
set author=Sadowson
set title=%map_cs%

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art" "%tmp%\Bits\art" /S
robocopy "%bits%\config" "%tmp%\Bits\config" /S
robocopy "%bits%\sound" "%tmp%\Bits\sound" /S
robocopy "%bits%\ui" "%tmp%\Bits\ui" /S
robocopy "%bits%\world\ai" "%tmp%\Bits\world\ai" /S
robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S
robocopy "%bits%\world\global" "%tmp%\Bits\world\global" /S
robocopy "%bits%\world\ui" "%tmp%\Bits\world\ui" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
