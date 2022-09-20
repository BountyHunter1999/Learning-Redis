network:
	docker network create redis
run:
	docker run -it --rm --name redis --net redis -p 6380:6379 redis:6.0-alpine
conf:
# run redis-server as entry point and it takes the location of the config as the 1st argument
	docker run -it --rm --name redis --net redis -v ${PWD}/config:/etc/redis redis:6.0-alpine redis-server /etc/redis/redis.conf
volume: 
	docker volume create redis
wvolume:
# /data/ is the default place that redis stores data
	docker run -it --rm --name redis --net redis -v ${PWD}/config:/etc/redis -v redis:/data/ redis:6.0-alpine redis-server /etc/redis/redis.conf
flask-build:
	docker build . -t mikeyy/flask-redis:v1.0.0
flask:
	docker run -it --rm --net redis \
	-e REDIS_HOST=redis \
	-e REDIS_PORT=6380 \
	-e REDIS_PASSWORD="SecretStrong" \
	-p 5000:5000 \
	mikeyy/flask-redis:v1.0.0

.PHONEY: network run conf volume wvolume flask