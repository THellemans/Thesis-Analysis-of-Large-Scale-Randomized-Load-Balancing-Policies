#include <iostream>
#include <algorithm>
#include <string.h>
#include <math.h> 
#include <bitset>
#include <vector>
#include <numeric>

int n, m, a, b, T, k1, k2;
long long int l, x, y, r;

int main() {

	std::cin >> T;
	for (int t = 0; t < T; ++t) {
		std::cin >> l >> r;
		if (2 * l <= r)
			std::cout << l << " " << 2 * l << std::endl;
		else
			std::cout << -1 << " " << -1 << std::endl;
	}

}