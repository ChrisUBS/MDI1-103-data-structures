import UIKit

// Q1
var items = ["Pen", "Notebook", "Eraser"]
items.append("Marker")
items.remove(at: 1)
print(items.count)

// Q2
var numbers: [Int] = [1, 2, 3, 4, 5]
numbers.remove(at: 2)
if numbers.contains(4) {
    print("numbers contains 4")
} else {
    print("numbers does not contain 4")
}

// Q3
var prices = ["Apple": 1.2, "Banana": 0.5]
prices.updateValue(0.6, forKey: "Banana")
prices.removeValue(forKey: "Apple")
print(prices.keys)

// Q4
var countries: [String: String] = ["Mexico": "Mexico City", "France": "Paris", "Germany": "Berlin"]
countries["USA"] = "Washington, D.C."
print(countries)
print(countries.values)

// Q5
let setA: Set = [1, 2, 3]
let setB: Set = [3, 4, 5]
let result = setA.union(setB)
print(result.sorted())

// Q6
var colors: Set<String> = ["Blue", "Black", "Red", "Yellow"]
colors.insert("White")
colors.remove("Blue")
print(colors.contains("Blue") ? "Colors contain blue" : "Colors don't contain blue")
