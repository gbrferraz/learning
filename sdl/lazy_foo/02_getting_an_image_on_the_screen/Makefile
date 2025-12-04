CXX = g++
CXXFLAGS = -Wall -g
LDFLAGS = -lSDL2
TARGET = image_on_screen
SRC = src/image_on_screen.cpp

run: $(TARGET)
	./$(TARGET)

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

clean:
	rm -f $(TARGET)
