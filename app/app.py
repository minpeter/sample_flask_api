from crypt import methods
from flask import Flask, request, jsonify
from flask_cors import CORS
from datetime import datetime

app = Flask(__name__)
CORS(app, resources=r'/*')

@app.route("/", methods = ['GET'])
def root():
    return jsonify({"msg": "This api is for testing purposes only.💻"})

@app.route("/helloworld", methods = ['GET'])
def helloworld():
    name = request.args.get("name")
    return jsonify({"msg": f"hello {name}!! 🦕"})

@app.route("/sql", methods = ['GET'])
def sql():
    query = request.args.get("query")
    print(query.find("'"))
    if query.find("'") != -1:
        return jsonify({"msg": "SQL injection detected.💀"})
    else:
        return jsonify({"msg": f"SQL query: {query} 🎈"})

@app.route("/egg", methods = ['GET'])
def egg():
    return jsonify({"msg": "🥚"})

@app.route("/time", methods = ['GET'])
def new():
    return jsonify({"server time": datetime.now()})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')