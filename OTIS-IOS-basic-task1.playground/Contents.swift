import UIKit

// Task 1

var array: [Int] = [20, 31, 51, 112, 89, 2]

var maxIndex = 0
var minIndex = 0

for (index, value) in array.enumerated() {
    if value > array[maxIndex] {
        maxIndex = index
    }
    
    if value < array[minIndex] {
        minIndex = index
    }
}
if maxIndex != minIndex {
    let tempMaxVal = array[maxIndex]
    array[maxIndex] = array[minIndex]
    array[minIndex] = tempMaxVal
}


//print("Array after swap max and min: \(array)")


// Task 2

var arr1: Array<String> = ["a", "d", "m", "mk", "vd", "bs"]

var arr2: Array<String> = ["i", "z", "m", "mk", "vd", "dm", "a"]

let checkTheSameEl = Set(arr1).intersection(Set(arr2))

//print(checkTheSameEl)


//Task 3

let nameAndPass: [String : String] = [
    "John": "qwe123",
    "Bella": "20091993asd",
    "Denis": "Kit2006qwe",
    "Steave": "devRullesSwiftCools123"
]
for (name, pass) in nameAndPass {
    if pass.count >= 10{
//        print(name)
    }
}
