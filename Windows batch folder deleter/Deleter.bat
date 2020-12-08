@ECHO off

rem The premise is that %1 is the argument from where we receive the folder
if "%1"=="" (
  set _errorMessage=It was not typed the folder to delete
  goto Error
)

if not exist %1 (
  set _errorMessage=The folder does not exist
  goto Error
) 


SetLocal EnableDelayedExpansion
set _isEmpty=

for /D %%a in ("%1\*") DO ( rem This for is to iterate each folder inside the route
set _TMP= rem We need to clean the 
for /f %%b in ('dir /a /b %%a') do set _TMP=%%b rem This for is to iterate each file inside the folder, to see if it contains data, /a shows all, /b grabs the file name

IF NOT DEFINED _TMP (
  echo %%a is Empty, proceed to delete it........
  RD /Q %%a
) ELSE (
  Echo %%a is Not Empty
)
							 )
exit /b
:Error
Echo %_errorMessage%