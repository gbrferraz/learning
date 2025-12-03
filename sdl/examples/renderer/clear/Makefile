# The compiler to use
CC = gcc

# The output file name
TARGET = clear

# The input file
SRC = clear.c

# Force the direct path since -lSDL3 is acting up
# We use $(shell ...) to get flags, but manually add the library path
CFLAGS = $(shell pkg-config --cflags sdl3)
LIBS = /usr/lib/libSDL3.so

all:
	$(CC) $(SRC) -o $(TARGET) $(CFLAGS) $(LIBS)

clean:
	rm -f $(TARGET)
