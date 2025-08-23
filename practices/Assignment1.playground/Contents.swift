import UIKit

// Step 1. Create array of student names
var studentsNames: [String] = ["Alice", "Bob", "Charlie", "Chris", "David"]

// Step 2. Use a dict to hold students grades
let studentGrades: [String: [Int]] = [
    "Alice:": [92, 78, 100],
    "Bob": [89, 78, 90],
    "Charlie": [90, 65, 80],
    "Chris": [100, 95, 90],
    "David": [90, 80, 60]
]

// Step 3. Print summary of each student's grades, including avg
print("STUDENT RECORD SUMMARY:\n")

var currentBiggest: Double = 0.00
var nameCurrentBiggest: String = ""
for (student, grades) in studentGrades {
    print("Student: \(student)")
    print("Grades: \(grades)")
    
    var avg: Double = Double(grades.reduce(0, +)) / Double(grades.count)
    if avg > currentBiggest {
        currentBiggest = avg
        nameCurrentBiggest = student
    }
    
    print(String(format: "Average: %.2f\n", avg))
}

// Step 4. Add functionality to identify and print the student with the highest average grade
print("The student \(nameCurrentBiggest) has the biggest average (\(currentBiggest))")
