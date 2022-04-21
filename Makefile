##
## Ximaz, 2022
## Makefile
## File description:
## Compile the stdlib with an entry point file
##

NAME=main
LIBNAME=stdlib
FMT=elf64# <- : obj, bin, elf, elf64, macho, macho64, etc...
DEBUG_FLAGS=-F stabs -g
SRC=stdlib/fs.asm \
	stdlib/io.asm \
	stdlib/string.asm \
	stdlib/sys.asm \
	stdlib/syscalls_id.asm \
	stdlib/types.asm

##
## Building the project :
##

$(NAME): $(NAME).o
	ld $(NAME).o -o $(NAME)

$(NAME).o: $(NAME).asm
	nasm -f$(FMT) -Ox $(DEBUG_FLAGS) $(NAME).asm -o $(NAME).o

all: $(NAME)

clean:
	rm -rf $(NAME).o $(LIBNAME).o

fclean: clean
	rm -rf $(NAME)

re: all clean

.PHONY: all clean fclean re
