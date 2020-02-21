
api-build:
	docker build -t workshop-shoppingcart-api -f src/api/Dockerfile src/api

api-start:
	docker run --name workshop-shoppingcart-api -p 5001:5001 -e ConnectionString="server=docker.for.mac.localhost;userid=root;password=1234;database=workshop_shoppingcart;convert zero datetime=True;CHARSET=utf8;" workshop-shoppingcart-api

ui-build:  
	docker build -t workshop-shoppingcart-ui -f src/ui/Dockerfile src/ui

ui-start:
	docker run --name workshop-shoppingcart-ui -p 80:80 workshop-shoppingcart-ui

db-build:
	docker build -t workshop-shoppingcart-mysql . -f Dockerfile_mysql

db-start:
	docker run --name=workshop-shoppingcart-mysql -p 3306:3306 workshop-shoppingcart-mysql

db-migrate:
	docker run --rm -e "LIQUIBASE_URL=jdbc:mysql://docker.for.mac.localhost/workshop_shoppingcart" -e "LIQUIBASE_USERNAME=root" -e "LIQUIBASE_PASSWORD=1234" -e "LIQUIBASE_CHANGELOG=data/changelog.yml" webdevops/liquibase:mysql update 

run-acceptance:
	robot --variable URL:http://localhost:8000 tests/ui.AcceptanceTest/

clean:
	echo "Y" | docker container prune
	echo "Y" | docker image prune
	echo "Y" | docker volume prune