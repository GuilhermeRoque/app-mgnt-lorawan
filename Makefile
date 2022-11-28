#usefull commands: show dbs; show collections; db.collection.find(); help;
login-mongo:
	docker exec -it app-mgnt-lorawan_mongo_1 mongo --username lorawanMgnt-admin --password lorawanMgnt-admin

up-build:
	docker-compose up --build

up:
	docker-compose up

down:
	sudo -v
	docker-compose down -v
	sudo rm -r influxdb2

clean-conteiners:
	docker conteiner prune