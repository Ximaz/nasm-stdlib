##
## Ximaz, 2022
## Makefile
## File description:
## Compile the stdlib with an entry point file
##

NAME=main
# FMT : obj, bin, elf, elf64, macho, macho64, etc...
FMT=elf64
DEBUG_FLAGS=-F stabs -g

$(NAME): $(NAME).o
	ld $(NAME).o -o $(NAME)

$(NAME).o: $(NAME).asm
	nasm -f$(FMT) -Ox $(DEBUG_FLAGS) $(NAME).asm -o $(NAME).o

all: $(NAME)

clean:
	rm -rf $(NAME).o

fclean: clean
	rm -rf $(NAME)

re: all clean

.PHONY: all clean fclean re
