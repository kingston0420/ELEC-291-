@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.c"
if not exist hex2mif.exe goto done
if exist Lab5-NOBONUS.ihx hex2mif Lab5-NOBONUS.ihx
if exist Lab5-NOBONUS.hex hex2mif Lab5-NOBONUS.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab5\Lab5-NOBONUS.hex
