import UIKit

//var arrayRandom: Array<UInt32> = (1...200).map{_ in arc4random_uniform(100)};

let count = 200;
var randomArray = [Int]();

for _ in 0..<count {
    let randomInt = Int.random(in: 1...500);
    randomArray.append(randomInt)
}

var findIndexOfNumber = [Int:Int]();

var ifNorepeateInt = -1;

for (index, num) in randomArray.enumerated(){
    if let existingIndex = findIndexOfNumber[num] {
        ifNorepeateInt = existingIndex
           break
       } else {
           findIndexOfNumber[num] = index
       }
}

if ifNorepeateInt != -1 {
    print("First repeating number:", randomArray[ifNorepeateInt], "at index:", ifNorepeateInt)
} else {
    print("All numbers are different")
}
