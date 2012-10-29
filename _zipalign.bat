:: 
:: LiQuID NiNJa ZiPaLiGN
:: 
@echo off
FOR %%F IN (%~dp0*.apk) DO (call :zipalign "%%F")

:zipalign
IF %1 == () goto end

:: defines tools folder
set parent="ninjatools"

:: makes working folder
md "%~dp0zipaligned"

:: defines tools location
set zipalign="%parent%\zipalign.exe"

:: -zipalign -v * (4) indicates the amount of bytes used to optimize apks
%zipalign% -v 4 "%~n1.apk" "%~dp0zipaligned\%~n1.apk"
del /q %1

:end
