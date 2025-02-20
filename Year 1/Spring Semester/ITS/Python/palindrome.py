def is_palindrome(s):
    return s == s[::-1]
    
def main():
    name = input("Name:")

    print(is_palindrome(name))


if __name__ == "__main__":
    main()