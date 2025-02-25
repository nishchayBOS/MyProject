enable_testing()

add_executable(test_runner test_main.cpp)
target_link_libraries(test_runner PRIVATE MyLibrary)

add_test(NAME MyTest COMMAND test_runner)
