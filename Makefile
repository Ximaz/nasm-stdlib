NAME	=	main

# Linker	options :
CC	=	ld
CFLAGS	=	-g -O0 # -fno-builtin -fstack-protector		\
		-fstack-protector-all -fsanitize=address	\
		-fno-omit-frame-pointer # no-pie

# NASM		options :
ASM	=	nasm
ASFLAGS	=	-g -O0 -felf64 # (obj, bin, elf, elf64, macho, macho64)
ASRC	=	$(wildcard stdio/*.asm fcntl/*.asm string/*.asm stdlib/*.asm) main.asm
AOBJ	=	$(ASRC:.asm=.o)

# Valgrind	options :
VFLAGS	=	--track-origins=yes --show-leak-kinds=all	\
		--leak-check=full -s --trace-children=yes	\
		--read-inline-info=yes --read-var-info=yes	\
		--errors-for-leak-kinds=all

TMP	=	$(NAME) $(wildcard *~)

all:	$(NAME)

%.o: %.asm
	$(ASM) $(ASFLAGS) $< -o $@

$(NAME):	$(AOBJ)
	$(CC) $(CFLAGS) $(AOBJ) -o $(NAME)

valgrind:	$(NAME)
	valgrind $(VFLAGS) ./$(NAME)

clean:
	rm -rf $(TMP)

fclean:	clean
	rm -rf $(OBJ) $(AOBJ)

re:	fclean	all

.PHONY:	all	clean	fclean	re
