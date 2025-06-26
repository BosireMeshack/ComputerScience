from flask import Flask, request, jsonify
from employee import Employee

app=Flask(__name__)

employees = []

@app.route("/employee", methods=["POST"])

def create_employee():
    data = request.get_json()
    name = data.get("name")
    gross_salary = data.get("gross_salary")

    if name and isinstance(gross_salary, (int, float)):
        emp = Employee(name, gross_salary)
        employees.append(emp)
        return jsonify(emp.get_json_payload()), 201
    return jsonify({"error" : "Invalid input"}), 400


@app.route("/employee", methods=["GET"])
def list_employees():
    startswith = request.args.get('startswith')
    if startswith:
        filtered = [e.get_json_payload() for e in employees if e.name.startswith(startswith)]
        return jsonify(filtered)
    return jsonify([e.get_json_payload() for e in employees])

@app.route('/employee/<id>/name', methods=['GET'])
def get_employee_name(id):
    for e in employees:
        if e.id == id:
            return jsonify({"name" : e.name})
    return jsonify({"error": "Employee not found"}), 404

@app.route('/employee/<id>/netsalary', methods=['GET'])
def get_employee_netsalary(id):
    for e in employees:
        if e.id == id:
            return jsonify({"net_salary": e.get_net_salary()})
    return jsonify({"error": "Employee not found"}), 404

if __name__ == "__main__":
    app.run(debug=True, port=8000)

