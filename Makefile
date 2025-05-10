# Makefile

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

backup:
	docker exec wp-db sh -c 'exec mysqldump -u root -p$$MYSQL_ROOT_PASSWORD $$MYSQL_DATABASE' > backup/backup.sql

restore:
	docker exec -i wp-db sh -c 'exec mysql -u root -p$$MYSQL_ROOT_PASSWORD $$MYSQL_DATABASE' < backup/backup.sql

shell:
	docker exec -it wp-app bash

dbshell:
	docker exec -it wp-db bash

reset:
	rm -rf data backup

clean:
	docker exec wp-app wp theme delete $(docker exec wp-app wp theme list --field=name | grep -v soul-travel-wp)
	docker exec wp-app wp plugin delete $(docker exec wp-app wp plugin list --field=name --status=inactive)

doom:
	docker compose down -v --remove-orphans
	rm -rf data plugins backup
