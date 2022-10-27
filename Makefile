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
VOLUME = /home/jihoh/data

all : $(NAME)

$(NAME):
	@ sudo mkdir -p $(VOLUME)/wp $(VOLUME)/db $(VOLUME)/log
	@ docker compose -f $(FILE) -p $(NAME) up -d

build:
	@ docker compose -f $(FILE) -p $(NAME) build --no-cache --force-rm

clean:
	@ docker compose -f $(FILE) -p $(NAME) down --rmi all --volumes --remove-orphans

fclean: clean
	@ sudo rm -rf $(VOLUME)
	@ docker system prune -a

stop:
	@ docker compose -f $(FILE) -p $(NAME) stop

re: fclean all

ps:
	@ docker ps

psa:
	@ docker ps -a

logs:
	@ docker compose -f $(FILE) -p $(NAME) logs

.PHONY: all, build, clean, fclean, stop, re, ps, psa, logs