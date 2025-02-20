import math

def multiply_lists(lhs, rhs):
  
 

  # Initialize the result array with zeros. The max length of the result will be len(lhs) + len(rhs).
    result = [0] * (len(lhs) + len(rhs))
    
    # Reverse both lists to handle multiplication from right to left.
    lhs = lhs[::-1]
    rhs = rhs[::-1]

    # Multiply each digit from lhs by each digit from rhs
    for i in range(len(lhs)):
        for j in range(len(rhs)):
            # Multiply the current digits
            product = lhs[i] * rhs[j]
            
            # Add to the corresponding position in the result array
            result[i + j] += product
            
            # Carry over if the result is greater than 10
            if result[i + j] >= 10:
                result[i + j + 1] += result[i + j] // 10
                result[i + j] = result[i + j] % 10

    # Remove leading zeros, if any
    while len(result) > 1 and result[-1] == 0:
        result.pop()
    
    # Reverse the result to get the final answer
    result.reverse()
    
    return result

def repeated_squaring(x, k):
    
    # If k is even, we compute (x^(k//2))^2
    # if k % 2 == 0:
    #     half_power = repeated_squaring(x, log(k,2))
    #     return half_power * half_power
    # # If k is odd, we compute x * x^(k-1)
    # else:
    #     return x * repeated_squaring(x, k - 1)
    if k == 0:
        return 1  # Base case: x^0 = 1

    result = 1
    while k > 0:
        if k % 2 == 1:  # If n is odd
            result *= x
        x *= x  # Square x
        k //= 2  # Divide n by 2 (using floor division)

    return result


if __name__ == '__main__':
  lhs = [1,2,3]
  rhs = [2, 4]
  lhs.pop()
#   print(lhs[-1])
#   print(multiply_lists(left, right))
  # print(multiply_lists(lhs, rhs))
  r = [0] * (len(lhs)+len(rhs))
  lhs = lhs[::-1]
  rhs = rhs[::-1]
for x in range(-10, 10):
    for k in range(1, 4):
        print(repeated_squaring(x, k) == x ** (2 ** k))
# print(repeated_squaring(-10,0))
  
  

