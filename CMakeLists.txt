cmake_minimum_required(VERSION 3.16)
project(MyProject VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable testing
include(CTest)

# Define source files
set(SOURCES src/MyLibrary.cpp)
set(HEADERS src/MyLibrary.h)

# Create a library
add_library(MyLibrary STATIC ${SOURCES})
target_include_directories(MyLibrary PUBLIC ${CMAKE_SOURCE_DIR}/include)

# Create an executable
add_executable(MyProject src/main.cpp)
target_link_libraries(MyProject PRIVATE MyLibrary)

# Install targets
install(TARGETS MyProject DESTINATION bin)
install(FILES include/MyLibrary.h DESTINATION include)

# Include CPack for packaging
include(CPack)
