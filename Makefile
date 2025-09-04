DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all:
	@echo "🚀 Starting Docker Compose..."
	@$(DOCKER_COMPOSE) up -d
	@echo "✅ Containers are up and running!"

stop:
	@echo "🛑 Stopping containers..."
	@$(DOCKER_COMPOSE) stop
	@echo "✅ Containers have stopped!"

start:
	@echo "🟢 Starting containers..."
	@$(DOCKER_COMPOSE) start
	@echo "✅ Containers have started!"

clean:
	@echo "🧹 Stopping and removing containers..."
	@$(DOCKER_COMPOSE) down
	@echo "✅ Containers stopped and removed!"

fclean:
	@echo "🧹 Stoping and removing containers, images, and volumes..."
	@$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans
	@echo "✅ Everything cleaned!"

re: fclean all