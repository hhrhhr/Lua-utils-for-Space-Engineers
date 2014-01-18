@echo off

set BLUR=0x2
set LEVEL=0x90%%
set color=#E43E3E-red- #65B25B-green- #93D0ED-blue- #FFFFFF-white-


setlocal enabledelayedexpansion

if exist MinerWars*.* del /q /f MinerWars*.*

echo generate bitmap and bmfc...
bmfont -c bmfont.bmfc -o MinerWars.fnt

for /r %%i in ("MinerWars_?.png") do (
    set m=%%~ni

    echo make base bitmap...
    convert %%i -alpha off !m!-white.png
    
    echo make alpha...
    convert.exe !m!-white.png ^( +clone -blur %BLUR% -level %LEVEL% ^) -compose Plus -composite !m!-alpha.png
    
    for %%c in (%color%) do (
        set p=%%c
        set hex=!p:~,7!
        set name=!p:~7,-1!

        echo make MinerWars!name!...
        convert !m!-white.png +level-colors !hex! -mask !m!-white.png -fill black -opaque !hex! +mask !m!!name!.png
        convert !m!!name!.png !m!-alpha.png -compose CopyOpacity -composite !m!!name!.png
    )
    del /q /f !m!-alpha.png
)


echo generate xmls...
luajit.exe generate_xml.lua


:eof
