
up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f ./srcs/docker-compose.yml build

clean:
	@docker image rm -f $(docker-compose -f ./srcs/docker-compose.yml images -q)
