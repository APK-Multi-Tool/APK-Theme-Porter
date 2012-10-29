:: 
:: LiQuID NiNJa OpTiPnG
:: 
@echo off
FOR %%F IN (%~dp0*.apk) DO (call :optipng "%%F")

:optipng
IF %1 == () goto end

:: defines tools folder
set parent="ninjatools"

:: makes working folders
md "%~dp0optimized"
md "%~dp0untouched"
md "%~dp0liquid_otemp_%~n1"

:: defines tools location
set szip="%parent%\7za.exe"
set roptipng="%parent%\roptipng.exe"

:: uncompressing contents of apks
%szip% x -o"%~dp0liquid_otemp_%~n1" %1

:: -o* (0-99) specifies how much the image is optimized
%roptipng% -o99 "%~dp0liquid_otemp_%~n1\**\*.png"
copy /b %1 "%~dp0untouched"
del /q %1

:: -mx* (0-9) indicates the compression level used for all working apks
%szip% a -tzip "%~dp0optimized\%~n1.apk" "%~dp0liquid_otemp_%~n1\*" -mx9 -mmt
rd /s /q "%~dp0liquid_otemp_%~n1"

:end
