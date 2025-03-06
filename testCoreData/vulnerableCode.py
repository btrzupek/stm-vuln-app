#
//  vulnerableCode.py
//  testCoreData
//
//  Created by Brian Trzupek on 3/5/25.
//
import sqlite3
from flask import Flask, request, redirect

app = Flask(__name__)

@app.route('/search')
def search():
    # SQL Injection vulnerability
    query = request.args.get('q', '')
    db = sqlite3.connect('database.db')
    cursor = db.cursor()
    # BAD: String formatting makes this vulnerable to SQL injection
    cursor.execute("SELECT * FROM users WHERE name LIKE '%" + query + "%'")
    results = cursor.fetchall()
    return str(results)

@app.route('/redirect')
def unsafe_redirect():
    # Open redirect vulnerability
    destination = request.args.get('url', '')
    # BAD: No validation of redirect destination
    return redirect(destination)

@app.route('/eval')
def unsafe_eval():
    # Code injection vulnerability
    user_input = request.args.get('code', '')
    # BAD: Evaluating user input as code
    result = eval(user_input)
    return str(result)

@app.route('/command')
def unsafe_command():
    # Command injection vulnerability
    import os
    command = request.args.get('cmd', '')
    # BAD: Executing shell commands with user input
    os.system(command)
    return "Command executed"

if __name__ == '__main__':
    app.run(debug=True)
