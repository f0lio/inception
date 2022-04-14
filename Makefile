include ./srcs/.env

# an ENV variable is used to create the named volumes,
# but docker-compose (AFAIK) does not support env_file option at that section,
# and calling `docker-compose -f ./srcs/docker-compose.yml` will not see .env file,
# because it is not in the same directory as docker-compose.yml. so...
COMPOSE		= cd srcs && docker-compose

WP_DIR		= /home/$(USERNAME)/data/wp
DB_DIR		= /home/$(USERNAME)/data/db

.init:
	@echo "Initializing..."
ifneq ($(grep -q $(DOMAIN_NAME) /etc/hosts), 0)
	@echo "Adding domain name to /etc/hosts..."
	@DOMAIN_IS_OK=$(echo "127.0.0.1 $(DOMAIN_NAME)" >> /etc/hosts)
	@$$DOMAIN_IS_OK || echo "Domain name added to /etc/hosts"
	@$$DOMAIN_IS_OK && echo "Failed to add domain name to /etc/hosts"
	@echo "skipping..."
endif

# ifneq ($(test ! -d $(WP_DIR)), 0)
# 	@mkdir -p $(WP_DIR)
# endif
# ifneq ($(test ! -d $(DB_DIR)), 0)
# 	@mkdir -p $(DB_DIR)
# endif

up: .init
	@${COMPOSE} up -d --remove-orphans

down:
	@${COMPOSE} down

build: .init
	@${COMPOSE} build

re: fclean build up	

clean: down rm

fclean: clean
	@${COMPOSE} images -q | xargs docker rmi 2>/dev/null || true	

rm:
	@${COMPOSE} rm -f || true
	@${COMPOSE} volumes rm -f || true
