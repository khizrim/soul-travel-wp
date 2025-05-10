PLUGINS = ./plugins
THEMES = ./themes
DATA = ./data
BACKUP = ./backup

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

backup:
	docker exec wp-db sh -c 'exec mysqldump -u root -p$$MYSQL_ROOT_PASSWORD $$MYSQL_DATABASE' > $(BACKUP)/backup.sql

restore:
	docker exec -i wp-db sh -c 'exec mysql -u root -p$$MYSQL_ROOT_PASSWORD $$MYSQL_DATABASE' < $(BACKUP)/backup.sql

shell:
	docker exec -it wp-app bash

dbshell:
	docker exec -it wp-db bash

reset:
	rm -rf data backup

clean:
	rm -rf $(THEMES)/twentytwentythree
	rm -rf $(THEMES)/twentytwentyfour
	rm -rf $(THEMES)/twentytwentyfive
	rm -rf $(PLUGINS)/hello.php

doom:
	docker-compose down -v --remove-orphans
	make clean