# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jihoh <jihoh@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/20 15:06:09 by jihoh             #+#    #+#              #
#    Updated: 2022/10/20 16:59:24 by jihoh            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

FILE = srcs/docker-compose.yml

up:
	@ docker compose -f $(FILE) -p $(NAME) up -d

build:
	@ docker compose -f $(FILE) -p $(NAME) build --no-cache --force-rm

stop:
	@ docker compose -f $(FILE) -p $(NAME) stop

down:
	@ docker compose -f $(FILE) -p $(NAME) down --remove-orphans

restart:
	@ make down
	@ make up

destroy:
	@ docker compose  -f $(FILE) -p $(NAME) down --rmi all --volumes --remove-orphans

destroy-volumes:
	@ docker compose -f $(FILE) -p $(NAME) down --volumes --remove-orphans 

ps:
	@ docker compose -f $(FILE) ps

psa:
	@ docker compose -f $(FILE) ps -a

logs:
	@ docker compose -f $(FILE) -p $(NAME) logs

.PHONY: all, clean, fclean, re, start, stop, restart, log, ps, up, down