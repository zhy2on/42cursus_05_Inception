# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jihoh <jihoh@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/20 15:06:09 by jihoh             #+#    #+#              #
#    Updated: 2022/11/04 15:13:26 by jihoh            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

FILE = srcs/docker-compose.yml
VOLUME = /home/jihoh/data

all : $(NAME)

$(NAME):
	@ sudo mkdir -p $(VOLUME)/wp $(VOLUME)/db $(VOLUME)/log
	@ docker compose -f $(FILE) -p $(NAME) up -d

clean:
	@ docker compose -f $(FILE) -p $(NAME) down --rmi all --volumes --remove-orphans

fclean: clean
	@ sudo rm -rf $(VOLUME)
	@ docker system prune -a

re: fclean all

logs:
	@ docker compose -f $(FILE) -p $(NAME) logs

.PHONY: all, clean, fclean, re, logs