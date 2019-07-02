# SonarQube
https://sonarcloud.io/dashboard?id=workshop-shoppingcart

# Unit and Ingration Test
## Run Unit Test on Localhost (Install dotnet before)
cd tests/api.UnitTest/

dotnet test

cd ../../

## Run Integrate Test on Localhost (Install dotnet before)
cd tests/api.IntegrationTest/

dotnet test

cd ../../

## Unit and Ingration Test in docker 
docker build -t workshop-shoppingcart-api-test .

docker run --rm -e RUNNING_PROJECT=./tests/api.UnitTest/api.UnitTest.csproj workshop-shoppingcart-api-test

docker run --rm -e RUNNING_PROJECT=./tests/api.IntegrationTest/api.IntegrationTest.csproj workshop-shoppingcart-api-test

# Install Mysql
## Build image
docker build -t workshop-shoppingcart-mysql . -f Dockerfile_mysql

## Run container
docker run --rm --name=workshop-shoppingcart-mysql -p 3306:3306 workshop-shoppingcart-mysql

# Data Migration into Mysql
## run docker liquibase's image to migrate data from changelog.yml

docker run --rm -v $(pwd)/data:/liquibase/ -e "LIQUIBASE_URL=jdbc:mysql://docker.for.mac.localhost/workshop_shoppingcart" -e "LIQUIBASE_USERNAME=root" -e "LIQUIBASE_PASSWORD=1234" -e "LIQUIBASE_CHANGELOG=changelog.yml" webdevops/liquibase:mysql update

# Install API

## Build Image
cd src/api/

docker build -t workshop-shoppingcart-api .

## Run container
docker run --name workshop-shoppingcart-api
\ -p 5001:5001
\ -e ConnectionString="server=docker.for.mac.localhost;userid=root;password=1234;database=workshop_shoppingcart;convert zero datetime=True;CHARSET=utf8;" 
\ workshop-shoppingcart-api



## Temporary Run on Localhost, not use docker
ASPNETCORE_ENVIRONMENT=Localhost dotnet run

# Install UI
## Build Image
cd src/ui/ 

docker build -t workshop-shoppingcart-ui .

## Run container
docker run --name workshop-shoppingcart-ui -p 80:80 workshop-shoppingcart-ui

# Run Robot Framework
cd tests/ui.AcceptanceTest/

## Localhost
pybot --exclude "Not Implement" --variable URL:http://localhost .

## Run Robot on Docker

docker run --rm -v $(pwd)/reports:/opt/robotframework/reports -v $(pwd):/opt/robotframework/tests -e BROWSER=chrome -e ROBOT_OPTIONS=" --variable URL:http://docker.for.mac.localhost --variable BROWSER:firefox" siamchamnankit/sck-robot-framework



# Start Jenkins

## Run Jenkins on Docker

docker run --rm --name workshop-shoppingcart-ci-cd -u root -p 8080:8080 -v $(pwd)/jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home -e "BASE_PATH=$(pwd)/jenkins-data" jenkinsci/blueocean

## Open Browser to create new pipeline 

http://localhost:8080/blue/organizations/jenkins/pipelines 