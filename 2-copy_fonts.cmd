@echo off

set D=f:\lalala\Space Engineers\Content\Fonts

copy /y MinerWars_?-blue.png  "%D%\MinerWars-blue\"
copy /y MinerWars_?-green.png "%D%\MinerWars-green\"
copy /y MinerWars_?-red.png   "%D%\MinerWars-red\"
copy /y MinerWars_?-white.png "%D%\MinerWars-white\"

copy /y MinerWars-blue.xml  "%D%\MinerWars-blue\MinerWars.xml"
copy /y MinerWars-green.xml "%D%\MinerWars-green\MinerWars.xml"
copy /y MinerWars-red.xml   "%D%\MinerWars-red\MinerWars.xml"
copy /y MinerWars-white.xml "%D%\MinerWars-white\MinerWars.xml"
