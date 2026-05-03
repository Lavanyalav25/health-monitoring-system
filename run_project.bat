@echo off
setlocal
echo.
echo ****************************************************
echo   HEALTH GUARD - PROFESSIONAL STUDENT PROJECT
echo ****************************************************
echo.

echo Step 1: Checking Java...
java -version
if errorlevel 1 goto java_error

echo.
echo Step 2: Checking Maven...
call mvn -v
if errorlevel 1 goto maven_error

echo.
echo Step 3: Starting Server on Port 8081...
echo (Opening browser: http://localhost:8081)
start "" "http://localhost:8081"

call mvn clean spring-boot:run
goto end

:java_error
echo.
echo [ERROR] Java is not installed or not in PATH!
pause
exit /b

:maven_error
echo.
echo [ERROR] Maven (mvn) is not installed or not in PATH!
pause
exit /b

:end
echo.
echo Server Stopped.
pause
