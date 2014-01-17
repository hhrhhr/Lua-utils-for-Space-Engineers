@echo off
setlocal enabledelayedexpansion

if exist MinerWars*.* del /q /f MinerWars*.*


echo generate bitmap and bmfc...
bmfont -c bmfont.bmfc -o MinerWars.fnt


set color=#E43E3E-red- #65B25B-green- #93D0ED-blue- #FFFFFF-white-

echo make base bitmap...
convert MinerWars_0.png -alpha off MinerWars-white.png

echo make alpha...
convert.exe MinerWars-white.png ( +clone -blur 0x5 -level 0x75%% ) -compose Plus -composite MinerWars-alpha.png

for %%c in (%color%) do (
    set p=%%c
    set hex=!p:~,7!
    set name=!p:~7,-1!
    echo make MinerWars!name!...
    convert MinerWars-white.png +level-colors !hex! -mask MinerWars-white.png -fill black -opaque !hex! +mask MinerWars!name!.png
    convert MinerWars!name!.png MinerWars-alpha.png -compose CopyOpacity -composite MinerWars!name!.png
)

del /q /f MinerWars-alpha.png


echo generate xmls...
luajit.exe generate_xml.lua


:eof
