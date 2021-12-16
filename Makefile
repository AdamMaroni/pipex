NAME = pipex
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
CFLAGS = -Wall -Werror -Wextra
CC = clang
LIBFT_ARCHIVE = libft/libft.a
HEADER = pipex.h
NAME = pipex
INPUT = inFile "cat -e" "wc -l" outFile
GDB_SCRIPT = gdbscripts/1.gdb
VALGRIND_CHECKER = --leak-check=full --trace-children=yes
DEBUG_FLAGS = -g 

all: $(NAME)

$(LIBFT_ARCHIVE): 
	make -C libft all

$(NAME): $(LIBFT_ARCHIVE) $(OBJ) $(HEADER)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME) $(LIBFT_ARCHIVE)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean $(NAME)

debug: $(LIBFT_ARCHIVE) $(SRC) $(HEADER)
	$(CC) $(DEBUG_FLAGS) $(SRC) -o $(NAME) $(LIBFT_ARCHIVE)
	gdb -x $(GDB_SCRIPT) --args ./$(NAME) $(INPUT)

mem_check: $(LIBFT_ARCHIVE) $(SRC) $(HEADER)
	$(CC) -g  $(SRC) -o $(NAME) $(LIBFT_ARCHIVE)
	valgrind $(VALGRIND_CHECKER) ./$(NAME) $(INPUT)
	
