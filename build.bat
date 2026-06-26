@echo off
setlocal

mvn package
if errorlevel 1 (
  echo.
  echo Build failed. Install Java/JDK and Maven, then run build.bat again.
  exit /b 1
)

echo.
echo Built target\UnitedFormats-1.0.0.jar
