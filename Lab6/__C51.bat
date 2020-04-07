@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\test bonus.c"
if not exist hex2mif.exe goto done
if exist test bonus.ihx hex2mif test bonus.ihx
if exist test bonus.hex hex2mif test bonus.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab6\test bonus.hex
