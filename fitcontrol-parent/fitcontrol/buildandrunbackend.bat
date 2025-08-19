@echo off
echo Running Mvn clean install...
call mvn clean install -DskipTests
echo Running Maven Clean and Package...
call mvn clean package -DskipTests || (
  echo Maven failed but script continues...
)
REM ignore errors and continue
echo stop docker container:
docker stop fitcontrol-backend
echo remove old container:
docker rm fitcontrol-backend
echo Docker build step:
docker build -t fitcontrol-backend .
echo Docker run step:
REM docker run --name fitcontrol-backend fitcontrol-backend
docker run -d -p 8083:8083 --name fitcontrol-backend fitcontrol-backend
pause
