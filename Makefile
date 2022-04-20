##
## Ximaz, 2022
## Makefile
## File description:
## Compile the stdlib with an entry point file
##

NAME=main
# FMT : obj, bin, elf, elf64, macho, macho64, etc...
FMT=elf64
DEBUG_FLAGS=-F dwarf -g

$(NAME).o:
	nasm -f$(FMT) $(DEBUG_FLAGS) $(NAME).asm -o $(NAME).o

$(NAME): $(NAME).o
	ld $(NAME).o -o $(NAME)

all: $(NAME)

clean:
	rm -rf $(NAME).o

fclean: clean
	rm -rf $(NAME)

re: all clean

.PHONY: all clean fclean re
