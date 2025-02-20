
print("Welcome to my simple python calculator. Input the first operand, second operand and the operator and you'll get the result.")
print("Use the following operands")
print("sum +")
print("Subtraction -")
print("Product *")
print("Divison /")


a = int(input("Enter the first operand: "))
b = int(input("Enter the second operand: "))
op = input("Enter the operand: ")

if op == '+':
    print("Sum = ", a+b)
elif op == '-':
    print("Difference ", a-b)
elif op == "*":
    print("Product = ", a*b)
elif op == "/":
    print("Quotient = ", a/b)

