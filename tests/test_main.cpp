#include <iostream>
#include "MyLibrary.h"

int main() {
    int result = add(5, 5);
    if (result == 10) {
        std::cout << "Test Passed!" << std::endl;
        return 0;
    } else {
        std::cout << "Test Failed!" << std::endl;
        return 1;
    }
}
