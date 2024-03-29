# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lminta <lminta@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/02 20:58:32 by lminta            #+#    #+#              #
#    Updated: 2019/09/14 16:44:11 by lminta           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Wolf3D

INC = -I $(FRAMEDIR)/SDL2.framework/Versions/A/Headers -I ./inc \
-I $(FRAMEDIR)/SDL2_image.framework/Versions/A/Headers \
-I $(FRAMEDIR)/SDL2_ttf.framework/Versions/A/Headers \
-I $(FRAMEDIR)/SDL2_mixer.framework/Versions/A/Headers \

FRAMEDIR = ./Frameworks

FRAME = $(FRAMEDIR)/SDL2.framework $(FRAMEDIR)/SDL2_image.framework \
$(FRAMEDIR)/SDL2_mixer.framework $(FRAMEDIR)/SDL2_ttf.framework

FLAGS = -Ofast -Wall -Werror -Wextra -c

LIBS = lib

FLAGS2 = -F $(FRAMEDIR) -framework SDL2 -framework SDL2_image \
-framework SDL2_ttf -framework SDL2_mixer -lftgnl -lft -lm \
-rpath $(FRAMEDIR)

OBJ = src/main.o src/help_fun.o src/init.o src/load_surf.o \
src/draw_line.o src/help_fun2.o src/round_fun.o src/cam_koen.o \
src/draw_rect.o src/map_reader.o src/draw_screen.o src/keys_events.o \
src/keys_extra.o src/enemy_player.o src/keys.o src/new_win.o \
src/keys2.o src/keys3.o

.PHONY: clean fclean re

all: $(LIBS) $(NAME)

$(NAME): $(OBJ)
	make -C Get_Next_Line
	gcc $(OBJ) -L $(LIBS) $(INC) $(FLAGS2) -o $(NAME)

$(OBJ): %.o: %.c
	gcc $(FLAGS) $(INC) $< -o $@

clean:
	make -C Get_Next_Line clean
	rm -f $(OBJ)

fclean: clean
	make -C Get_Next_Line fclean
	rm -f $(NAME)

#$(FRAME): $(FRAMEDIR)/%: Frameworks/%
#	cp -R $< $(FRAMEDIR)

$(LIBS):
	mkdir lib

re: fclean all
