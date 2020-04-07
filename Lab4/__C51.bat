@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab4\Submit\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab4\Submit\lab4.c"
if not exist hex2mif.exe goto done
if exist lab4.ihx hex2mif lab4.ihx
if exist lab4.hex hex2mif lab4.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\K\Desktop\courses\3rd Year term2\ELEC291\lab4\Submit\lab4.hex
