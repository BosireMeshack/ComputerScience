def get_divisors(n: int) -> list[int]:
    divisors = []

    for i in range(1, n + 1):
        if n % i == 0:
            divisors.append(i)

    return sorted(divisors)


def sieve_of_erathosthenes(n: int) -> list:
    primes = [True] * (n + 1)
    primes[0] = primes[1] = False

    for p in range(2, int(n**0.5) + 1):
        if primes[p]:
            for i in range(p * p, n + 1, p):
                primes[i] = False
    return [f for f in range(2, n+1) if primes[f]]

def prime_factorization(n):
    factors = {}
    d = 2
    while d * d <= n:
        while n % d == 0:
            factors[d] = factors.get(d, 0) + 1
            n //= d
        d += 1
    if n > 1:
        factors[n] = 1
    return factors

def lcm_via_factors(a : int, b : int) -> int:
      factors_a = prime_factorization(a)
      factors_b = prime_factorization(b)
      lcm_factors = {}
      for p in factors_a.keys() | factors_b.keys():
         lcm_factors[p] = max(factors_a.get(p, 0), factors_b.get(p, 0))
      lcm = 1
      for p, e in lcm_factors.items():
          lcm *= p**e
      return lcm


if __name__ == "__main__":
    # print(get_divisors(100))
    # print(sieve_of_erathosthenes(100))
    # print(prime_factorization(100))
    # print(prime_factorization(120))
    print(lcm_via_factors(100, 120))

