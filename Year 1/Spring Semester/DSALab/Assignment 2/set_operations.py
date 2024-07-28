# Prints an array
def print_array(setA):
    print(' '.join(map(str, setA)))

# Returns a union with double similar elements
def duplicate_union(setA, setB):
    setA.extend(setB)  # Add elements of setB to setA
    print_array(setA)  # Print the union after duplication

def intersection(setA, setB):
    union= []
    for i in range(len(setB)):
        for j in range(len(setA)):
            if(setA[j] == setB[i]):
                union.append(setA[j])
    print_array(union)

def main():
    setA = [1, 2, 3, 4, 5]
    setB = [1, 7, 8]

    duplicate_union(setA, setB)
    intersection(setA, setB)

if __name__ == "__main__":
    main()
