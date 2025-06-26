import unittest

# Function to be tested
def add(a, b):
    return a + b

# Unit test class inheriting from unittest TestCase

class TestAddFunction(unittest.TestCase):
    # Test method, should start with 'test'
    def test_add_integers(self):
        self.assertEqual(add(1,2),3)

    def test_add_Floats(self):
        self.assertAlmostEqual(add(1.5, 2.3), 4.0)

    def test_add_strings(self):
        self.assertEqual(add("hello ", "world"), "hello world")

if __name__ == "__main__":
    unittest.main() 
