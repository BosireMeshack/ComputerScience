import uuid
import json


class Employee():
    
    def __init__(self, name, gross_salary):
        self.id= self.generate_id()
        self.name = name
        self.gross_salary = gross_salary

    def generate_id(self):
        return str(uuid.uuid4())[:8]
        
    def get_net_salary(self, tax_rate=0.30):
        
        return (1-tax_rate)* self.gross_salary
    
    def get_json_payload(self):
        dict= {"name":self.name, "id":self.id, "gross_salary":self.gross_salary, "net_salary":round(self.get_net_salary(), 2)}
        return dict


emp1 = Employee("Meshack", 40000)
# emp1.generate_id()

print(emp1.get_json_payload())