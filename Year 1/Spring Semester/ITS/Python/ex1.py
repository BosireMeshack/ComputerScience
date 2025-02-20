import pylab

def prime_below_100():
    ls = []
    for x in range(100):
        
        prime = pylab.is_prime(x)
        if prime == True:
            ls.append(x)
    print(ls)


def main():
    prime_below_100()



if __name__ == "__main__":
    main()