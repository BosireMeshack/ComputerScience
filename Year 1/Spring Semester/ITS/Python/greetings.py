class Greetings:
    def __init__(self, name):
        self.name = name
    def say_hi(self):
        print(f"Hi {self.name}!")

    def __str__(self):
        return self.name


def main():
    g = Greetings("Alice")
    g.say_hi()
    print(g)



if __name__ == "__main__":
    main()