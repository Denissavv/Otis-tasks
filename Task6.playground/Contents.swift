import UIKit

//1
func sumInts(_ a1: Int, _ a2: Int) -> Int {
    return a1 + a2
}

//print (sumInts(4, 2));

//2
func corgateToString ( _ n1: String, _ n2: Int) -> String {
    return String(n2)
    
}

//print (corgateToString("4", 5));



//3
typealias typeForClosure = (Int, Int) -> String;

var myClosure: typeForClosure = { (a: Int, b: Int) -> String in

    return ("First Int is: \(a), second is: \(b)")
    
}

func closure ( a1: Int, callback: typeForClosure) -> String{
    if (a1 > 0){
       return callback(a1, a1 + 5)
    }
    return "value is less than 0"
}

//print(closure(a1: 4, callback: myClosure))
//print(closure(a1: 0, callback: myClosure))



//4

typealias returnInt = (Int) -> Bool;

var checkILeap = {(year: Int) -> Bool in
    if (year % 400 == 0) {return true};
    if (year % 100 == 0) {return false};
    if (year % 4 == 0) {return true};
    return false
}

func leapChecker (year: Int, callback: returnInt) -> Bool {
    if (year > 1900 && year < 2500){
        return callback(year)
    }
    return false
}

//print(leapChecker(year:2004, callback: checkILeap))
