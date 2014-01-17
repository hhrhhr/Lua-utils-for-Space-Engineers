Lua-utils-for-Space-Engineers
=============================

generate bitmap font from TTF

tools
-----

* Bitmap Font Generator (http://www.angelcode.com/products/bmfont/)
* `convert` utility from ImageMagick (http://imagemagick.org)
* luajit 2.0 (http://luajit.org)

usage
-----

* copy `bmfont.exe`, `convert.exe`, `luajit.exe`, `lua51.dll`
* run BMFont, select needed chars, press `F`, select font, don't touch other options
* press `V` (preview), if the font is not got one page then press `T` and increase the size of the texture ()
* close BMFont
* run `1-make_fonts.cmd`, 4 textures and descriptors will appear in your working directory; files `MinerWars-*.xml` need to rename to `MinerWars.xml`

