cmake_minimum_required(VERSION 3.16)
project(MyProject VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include modules
include(cmake/Dependencies.cmake)

option(BUILD_DOC "Build documentation using Doxygen" ON)

if(BUILD_DOC)
    include(cmake/generateDoc.cmake)  # Include the script for documentation
    generate_documentation("${PROJECT_SOURCE_DIR}/docs/Doxyfile.in")
endif()

# Enable testing
include(CTest)

# Define sources
set(SOURCES src/MyLibrary.cpp)
set(HEADERS include/MyLibrary.h)

# Create a static library
add_library(MyLibrary STATIC ${SOURCES})
target_include_directories(MyLibrary PUBLIC ${CMAKE_SOURCE_DIR}/include)

# Create an executable
add_executable(MyProject src/main.cpp)
target_link_libraries(MyProject PRIVATE MyLibrary)

# Add the test directory
add_subdirectory(tests)

# Install rules
install(TARGETS MyProject DESTINATION bin)
install(FILES include/MyLibrary.h DESTINATION include)

# Packaging
include(CPack)
