from flask import Flask, jsonify

app = Flask(__name__)

# Fake patient database
patients = {
1: "Alice Johnson",
2: "Bob Smith",
3: "Charlie Lee"
}
@app.route("/patients", methods=["GET"])
def list_patients():
       all_patients = [{"patient_id": pid, "name": name} for pid, name in patients.items()]
       return jsonify(all_patients)

app.run(debug=True)




