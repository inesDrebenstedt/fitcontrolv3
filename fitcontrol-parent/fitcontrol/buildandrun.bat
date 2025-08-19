@echo off
echo Running Maven Clean and Package...
call mvn clean package -DskipTests || (
  echo Maven failed but script continues...
)
REM ignore errors and continue
echo ----- ...
docker build -t fitcontrol-backend .
docker run --name fitcontrol-backend fitcontrol-backend
pause
