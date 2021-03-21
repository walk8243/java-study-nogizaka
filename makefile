define APP_RUN
	@docker exec -d nogi-profile.api /bin/sh -c - "java -jar nogi-profile.jar >/var/log/nogi-profile.log 2>&1"
endef

define MYSQL_LOGIN
	@docker exec -it nogi-profile.mysql /bin/sh -c - "mysql -Dnogizaka -pvmu71FJ7Y6vB"
endef

.PHONY: up run gs logs down clean build

up: build
	docker-compose up --detach --force-recreate
	@docker exec nogi-profile.api sleep 5
	$(call APP_RUN)
	@echo access to http://localhost:49146/

run:
	$(call APP_RUN)

gs:
	@docker exec nogi-profile.api /bin/bash bin/kill.sh

logs:
	@docker exec nogi-profile.api tail /var/log/nogi-profile.log -n 200 -f

mysql:
	$(call MYSQL_LOGIN)

down:
	docker-compose stop --timeout 1

clean:
	docker-compose down
	docker volume prune --force

build:
	make -C ./java-study-nogizaka-api build
	docker build -t nogi-profile-mysql -f docker/mysql/Dockerfile .
