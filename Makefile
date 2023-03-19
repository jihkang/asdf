VOLUME_DIR	:=	/home/jihkang/Desktop/data
DOCKER_COMPOSE	:=	docker-compose
DOCKER_COMPOSE_FILE	:=	./srcs/docker-compose.yml
PROJECT_NAME	:=	Inception
NETWORK_NAME := network-inception

all:
	@mkdir -p $(VOLUME_DIR)/db_data
	@mkdir -p $(VOLUME_DIR)/wordpress
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up --build -d

up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up
	$(DOCKER_COMPOSE) logs

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean: down
	docker system prune -f --all # Remove all unused images not just dangling ones

fclean: clean
	@rm -rf $(VOLUME_DIR)/db_data/*
	@rm -rf $(VOLUME_DIR)/wordpress/*
	@docker volume rm $$(docker volume ls -q)

re: fclean all

.PHONY: all up down clean fclean re