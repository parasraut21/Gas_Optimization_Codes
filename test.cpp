#include <iostream>
#include <cmath>

bool isPrime(int num) {
    if (num <= 1) {
        return false;
    }
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

int closestPrime(int n) {
    if (n <= 1) {
        return 2;
    }

    if ((n & 1) == 0) {
        n++; // Make it odd, as even numbers (except 2) are not prime
    }

    while (!isPrime(n)) {
        n += 2; // Skip even numbers
    }

    return n;
}

int main() {
    int n = 36; // Replace with your desired number
    int result = closestPrime(n);

    std::cout << "Closest prime to " << n << " is: " << result << std::endl;

    return 0;
}
