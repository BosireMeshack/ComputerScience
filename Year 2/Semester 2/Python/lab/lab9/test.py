import requests

# Base URL of the running Flask server
BASE_URL = "http://localhost:8000/employee"


employees_data = [
    {"name": "Alice Johnson", "gross_salary": 5000},
    {"name": "Bob Smith", "gross_salary": 6200},
    {"name": "Charlie Brown", "gross_salary": 4500},
    {"name": "Diana Prince", "gross_salary": 7800},
    {"name": "Evan Turner", "gross_salary": 5200},
    {"name": "Fiona Apple", "gross_salary": 6100},
    {"name": "George Michael", "gross_salary": 7000},
    {"name": "Hannah Lee", "gross_salary": 5400},
    {"name": "Isaac Newton", "gross_salary": 9999},
    {"name": "Jane Doe", "gross_salary": 3500}
]

# Create employees by sending POST requests
print("Creating employees...")
for emp in employees_data:
    response = requests.post(BASE_URL, json=emp)
    print(f"POST {emp['name']}: Status {response.status_code}, Response: {response.json()}")

# Get all employees to verify creation
print("\nFetching all employees...")
response = requests.get(BASE_URL)
print(f"Status: {response.status_code}")
for emp in response.json():
    print(emp)
