import UIKit

//task 1
class Calculate {
   
    private var a: Int = 0;
    private var b: Int = 0;

    var sum: Int {
        a + b
    }
    
    var substruct: Int {
        a - b
    }
    
    var devide: Int {
        a / b
    }
    
    var multiply: Int {
        a * b
    }
    
    
    init(a:Int, b:Int){
        self.a = a;
        self.b = b;
    }
   
}

var calcSum = Calculate(a:2, b: 3).sum;

var calcSubstruct = Calculate(a:40, b: 30).substruct;

var calcDevide = Calculate(a: 20, b: 2).devide;

var calkMultiply = Calculate(a: 3, b: 50).multiply





//task 2


class Figue {
    
    var description: String = "";
    var angleNum: Int = 0;
    
    init(description: String, angleNum: Int){
        self.description = description;
        self.angleNum = angleNum;
    }
    
    func draw (){
        if (angleNum == 3) {
            print("Traingle")
        } else if (angleNum == 4) {
            print("Square")
        } else if (angleNum == 5){
            print("Pentagon")
        } else if (angleNum == 5){
            print("Hexagon")
        } else {
            print("Circle")
        }
    }
    
}

let traingle = Figue(description:"traingle" , angleNum: 3).draw()

let square = Figue(description:"square" , angleNum: 4).draw()
