@echo off
setlocal enableextensions

set SCRIPT=%0
set DQUOTE="

:: Detect how script was launched
@echo %SCRIPT:~0,1% | findstr /l %DQUOTE% > NUL
if %ERRORLEVEL% EQU 0 set PAUSE_ON_CLOSE=1

call cd ..
call mocha --compilers coffee:coffee-script -R spec --reporter doc > test-results/body.html
call cd test

call cd ..
call cd test-results
call copy head.html+body.html+foot.html index.html

call start index.html

call cd ..
call cd test

:EXIT
if defined PAUSE_ON_CLOSE pause
