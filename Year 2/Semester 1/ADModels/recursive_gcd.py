def recursive_gcd(a, b):
    
    if b == 0:
        return a
    else:
        return recursive_gcd(b, a % b)
    
def non_recursive(a, b):
  
    while b != 0:
        temp = a
        a = b
        b = temp % b
    return a
        
            
    
        

if __name__ == "__main__":
    
    #print(recursive_gcd(12, 18))
    print(non_recursive(12, 18))