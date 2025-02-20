
def pro(ls):
    product = 1

    for i in ls:
        product*=i
    return product

def main():
    nums = [1, 2, 3, 4, 5]
    ans = pro(nums)
    print(ans)

main()