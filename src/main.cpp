#include <iostream>
#include "MyLibrary.h"

int main() {
    std::cout << "Hello, CMake Project!" << std::endl;
    int result = add(5, 3);
    std::cout << "5 + 3 = " << result << std::endl;
    return 0;
}
