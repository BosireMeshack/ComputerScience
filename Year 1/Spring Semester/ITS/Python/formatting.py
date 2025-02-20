def hello(name, what, color):
    print("{name}  the {what}  is  {color}".format(name=name, what=what,color=color))

def main():
    hello("meshack", "bus", "red")


if __name__ == "__main__":
    main()