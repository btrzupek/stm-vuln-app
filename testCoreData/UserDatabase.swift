//
//  UserDatabase.swift
//  testCoreData
//
//  Created by Brian Trzupek on 3/5/25.
//  This will trigger CodeQL Warnings, and is designed to


import Foundation

class UserDatabase {
    // Hard-coded credentials - security issue
    let dbPassword = "SuperSecretPassword123!"
    let dbUsername = "admin"
    
    // Potential SQL injection vulnerability
    func getUserData(userId: String) -> String {
        // Directly concatenating user input into SQL query - bad practice
        let query = "SELECT * FROM users WHERE id = '\(userId)'"
        return executeQuery(query: query)
    }
    
    // Insecure random number generation
    func generateToken() -> Int {
        // Using arc4random() which is less secure than modern alternatives
        return Int(arc4random())
    }
    
    // Simulated database query execution
    private func executeQuery(query: String) -> String {
        // Simulate database operation
        return "User data for query: \(query)"
    }
    
    private func doTheThing() {
        let db = UserDatabase()
        let userData = db.getUserData(userId: "user123'; DROP TABLE users;--")
        print(userData)
    }
}
