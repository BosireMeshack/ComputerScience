import pylab as pl
# from pylab import is_prime

def prime_below_200():
    ls = []
    for x in range(200):
        
        prime = pl.is_prime(x)
        if prime == True:
            ls.append(x)
    print(sum(ls))


def main():
    prime_below_200()



if __name__ == "__main__":
    main()