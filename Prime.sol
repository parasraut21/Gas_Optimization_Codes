// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract PrimeDifference {
    function primeDifference(uint n) public pure returns (uint) {
        if (n < 2) {
            return 2 - n;
        }

        uint m = n;

        unchecked {
            if ((m & 1) == 0) {
                ++m; // Make it odd, as even numbers (except 2) are not prime
            }

            bool isPrime;
            do {
                isPrime = true;
                for (uint i = 3; i * i <= m; i+=2) {
                    if (m % i == 0) {
                        isPrime = false;
                        break;
                    }
                }
                if (!isPrime) {
                    m += 2;
                }
            } while (!isPrime);
        }
        return m - n;
    }
}