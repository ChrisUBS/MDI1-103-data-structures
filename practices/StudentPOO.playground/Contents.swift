import UIKit

class Student {
    // Properties
    var name: String
    var age: Int
    var grades: [Int]
    
    // Init
    init(name: String, age: Int, grades: [Int]) {
        self.name = name
        self.age = age
        self.grades = grades
    }
    
    // Methods
    func getAverage() -> Double {
        var sum: Int = 0
        for grade in grades {
            sum += grade
        }
        return Double(sum / grades.count)
    }
    
    func isPassing() -> Bool {
        var average: Double = getAverage()
        if average >= 60 {
            return true
        }
        return false
    }
    
    func printInfo() {
        print("Name: \(self.name)")
        print("Age: \(self.age)")
        print("Grades: \(self.grades)")
        print("Average: \(self.getAverage())")
        self.isPassing() ? print("Status: Passing") : print("Status: Not passing")
    }
}

class Course {
    // Properties
    var students: [Student]
    
    // Init
    init(students: [Student] = []) {
        self.students = students
    }
    
    // Methods
    func addStudent(student: Student) {
        students.append(student)
    }
    
    func printStudents() {
        for student in students {
            student.printInfo()
            print("")
        }
    }
    
    func getCourseAverage() -> Double {
        var sum: Double = 0.00
        for student in students {
            sum += student.getAverage()
        }
        return Double(sum / Double(students.count))
    }
    
    func getHighestStudent() -> Student {
        var highestStudent: Student = students[0]
        for student in students {
            if student.getAverage() > highestStudent.getAverage() {
                highestStudent = student
            }
        }
        return highestStudent
    }
}

// Create students
var juan = Student(name: "Juan", age: 20, grades: [80, 70, 50, 90])
var carlos = Student(name: "Carlos", age: 21, grades: [70, 60, 50, 40])
var chris = Student(name: "Chris", age: 21, grades: [90, 95, 100, 90])

// Create a course and add students
var math = Course()
math.addStudent(student: juan)
math.addStudent(student: carlos)
math.addStudent(student: chris)

// Use course's methods
math.printStudents()
print("Course Average: \(math.getCourseAverage())")
var highestStudent = math.getHighestStudent()
print("The highest average was \(highestStudent.getAverage()) by \(highestStudent.name)")
