import UIKit

// Constant Array -> let arrayName = [10, 20, 30] -> let arrayName : [Int] = [10, 20, 30]
let myValues: [Int] = [10, 20, 30]
print(myValues)

//myValues.append(40)

// Empty Array
//var fruits: [String] = []
//var fruits = [String] ()
var age: [Int]
var prices: [Double]
var grades: [Float]
var isStund: [Bool]

// Accesing Arrays -> The Fruits List
var fruitsList: [String] = ["Apple", "Banana", "Orange"]

// Print the second fruit fruit -> Index
print("The second fruit is: ", fruitsList[1]) // Banana

// Accesing the last and the first item
print(fruitsList.first ?? "No fruit")
print(fruitsList.last ?? "No fruit")

// Looping the Array
for fruit in fruitsList {
    print(fruit)
}

for (index, fruit) in fruitsList.enumerated() {
    print("The index is: \(index) - The fruit name is: \(fruit)")
}

// Search an item by its value
print(fruitsList.contains("Apple"))
print(fruitsList.contains("apple"))

// Remove Items by Index
print("Removed Item:", fruitsList.remove(at: 2))
print("Fruits after removing: ", fruitsList)

// 1. Ask for the index of the value
if let indexItem = fruitsList.firstIndex(of: "Apple") {
    fruitsList.remove(at: indexItem)
}

// Removed all the items
fruitsList.removeAll()
print(fruitsList)

// Add one item
fruitsList.append("Mango")
fruitsList.append("Fresa")
print(fruitsList)

// How to add multiple items at once? -> Swift array add multiple items
fruitsList += ["Kiwi", "Strawberry"]
print(fruitsList)

fruitsList.append(contentsOf: ["Pineapple", "Grape"])
print(fruitsList)

// Sorting
let reversedList = Array(fruitsList.reversed())
print(reversedList)

let ascendingList = fruitsList.sorted()
print(ascendingList)

let descendingList = fruitsList.sorted(by: >)
print(descendingList)
