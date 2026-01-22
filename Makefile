up:
	docker compose up -d

down:
	docker compose down

reset:
	docker compose down -v
	docker compose up -d

db-export:
	docker compose exec db mysqldump -u$$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE | gzip > db/seed.sql.gz

db-import:
	gunzip -c db/seed.sql.gz | docker compose exec -T db mysql -u$$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE
