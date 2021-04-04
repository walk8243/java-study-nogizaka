.PHONY: up gs mysql down clean build

up: build
	docker-compose up --detach --force-recreate
	make -C ./java-study-nogizaka-api run
	make -C ./java-study-nogizaka-web run
	@echo WEB access to http://localhost:46467/
	@echo API access to http://localhost:46468/

gs:
	make -C ./java-study-nogizaka-api gs

mysql:
	@docker exec -it nogi-profile.mysql /bin/sh -c - "mysql -Dnogizaka -pvmu71FJ7Y6vB"

down:
	docker-compose stop --timeout 1

clean:
	docker-compose down
	docker volume prune --force

build:
	make -C ./java-study-nogizaka-api build
	make -C ./java-study-nogizaka-web build
	docker build -t nogi-profile-mysql -f ./docker/mysql/Dockerfile .
	docker build -t nogi-profile-keystore ./key-store
