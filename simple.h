#include <limits>

struct Simple {
    int x = 1;
    int y = 2;
    int z = 3;
};

float infinity() {
    return std::numeric_limits<float>::infinity();
}

float nan() {
    return NAN;
}
