# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jihoh <jihoh@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/20 15:06:09 by jihoh             #+#    #+#              #
#    Updated: 2022/10/20 17:37:33 by jihoh            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

FILE = srcs/docker-compose.yml

up:
	@ docker compose -f $(FILE) -p $(NAME) up

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
	@ rm -rf /home/jihoh/data/wp/*
	@ rm -rf /home/jihoh/data/db/*
	@ docker compose -f $(FILE) -p $(NAME) down --rmi all --volumes --remove-orphans

destroy-volumes:
	@ rm -rf /home/jihoh/data/wp/*
	@ rm -rf /home/jihoh/data/db/*
	@ docker compose -f $(FILE) -p $(NAME) down --volumes --remove-orphans 

ps:
	@ docker ps

psa:
	@ docker ps -a

logs:
	@ docker compose -f $(FILE) -p $(NAME) logs

.PHONY: all, clean, fclean, re, start, stop, restart, log, ps, up, down