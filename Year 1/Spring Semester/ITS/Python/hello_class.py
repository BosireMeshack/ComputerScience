
class Hello:
    def create_name(self, name):
        self.name = name
    def display_name(self):
        return self.name


def main():
    h = Hello()
    h.create_name("Alice")
    # print(h.name)
    print(h.display_name())

if __name__ == "__main__":
    main()