# fitcontrolv3
Exercise and workout tracker app.

Frontend is in Angular:
Angular CLI: 16.2.14
Node: 18.20.3
Package Manager: npm 10.7.0
OS: win32 x64

Angular: 16.2.12
... animations, common, compiler, compiler-cli, core, forms
... platform-browser, platform-browser-dynamic, router

Package                         Version
---------------------------------------------------------
@angular-devkit/architect       0.1602.14
@angular-devkit/build-angular   16.2.15
@angular-devkit/core            16.2.14
@angular-devkit/schematics      16.2.14
@angular/cdk                    16.2.14
@angular/cli                    16.2.14
@angular/material               16.2.14
@schematics/angular             16.2.14
rxjs                            7.8.1
typescript                      5.1.6
zone.js                         0.13.3

Java Backend is in Spring Boot Version 3.4.4.

1. /mariadb-docker
# Run Dockerfile along with .sql file as named in Dockerfile to build container
docker build -t <your-containername-for-database> .

2. /fitcontrol-parent/fitcontrol
# in your IDE, create the .jar with
mvn clean install -DskipTests
# then, build the backend docker container:
docker build -t <your-containername-for-backend> .
# then, run the container:
docker run -p 8083:8083 --name <your-imagename-for-backend>  <your-containername-for-backend> 

3. /frontend
# Run Dockerfile to build container
docker build -t <your-containername-for-frontend> .
# then, run the container:
docker run -p 80:80 --name <your-imagename-for-frontend>  <your-containername-for-frontend> 





