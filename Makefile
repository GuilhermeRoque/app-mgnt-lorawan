#usefull commands: show dbs; show collections; db.collection.find(); help;
login-mongo:
	docker exec -it app-mgnt-lorawan_mongo_1 mongo --username lorawanMgnt-admin --password lorawanMgnt-admin

secret := 29a2ac06-d5cb-4fd3-85ee-00d42234d41d
up-build:
	node createKeys.js access-token.key access-token.pub $(secret)
	node createKeys.js refresh-token.key refresh-token.pub $(secret)
	mv ./access-token.key ./auth-service/access-token.key
	mv ./refresh-token.key ./auth-service/refresh-token.key
	mv ./access-token.pub ./api-gateway-auth/access-token.pub
	mv ./refresh-token.pub ./api-gateway-auth/refresh-token.pub
	docker-compose up --build 
	
up-createKeys:
	node createKeys.js access-token.key access-token.pub $(secret)
	node createKeys.js refresh-token.key refresh-token.pub $(secret)
	mv ./access-token.key ./auth-service/access-token.key
	mv ./refresh-token.key ./auth-service/refresh-token.key
	mv ./access-token.pub ./api-gateway-auth/access-token.pub
	mv ./refresh-token.pub ./api-gateway-auth/refresh-token.pub
	docker-compose up


up-scale-device-proxy-2:
	docker-compose up --scale device-proxy=2

up:
	docker-compose up

down:
	sudo -v
	docker-compose down -v
	sudo rm -r influxdb2

clean-containers:
	docker container prune