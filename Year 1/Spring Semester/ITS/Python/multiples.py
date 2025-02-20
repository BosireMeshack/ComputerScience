def multiples_sum():
    ls = []
    for i in range(1001):
        if i%3 == 0 or i%5 == 0:
            ls.append(i)

    summation = sum(ls)
    print(ls)
    print(summation)
def main():
    multiples_sum()



if __name__ == "__main__":
    main()
