def main():
    try:
        a = int(input("1st Number: "))
        b = int(input("2nd Number: "))
        result = a / b
        print("We got here")
        print(round(result, 2))

    except ZeroDivisionError:
        print("Error, you cannot divide a number by zero")
        


if __name__ == "__main__":
    main()