CXX = g++
CXXFLAGS = -Wall -g
LDFLAGS = -lSDL2
TARGET = hello-sdl
SRC = src/hello_sdl.cpp

run: $(TARGET)
	./$(TARGET)

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

clean:
	rm -f $(TARGET)
