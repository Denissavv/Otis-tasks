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
        if (b == 0) {
           fatalError("cannot devide by 0")
        }
          return   a / b
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


class Figure {
    var description: String {
        return "Initial figure"
    }
    
    var numberOfAngles: Int {
        return 0
    }
    var draw: Void {
        print(description)
    }
}


class Traingle: Figure {
    override var description: String {
        return "This is Traingle"
    }
    
    override var numberOfAngles: Int {
        return 3
    }
}

class Square: Figure {
    override var description: String {
        return "This is Square"
    }
    
    override var numberOfAngles: Int {
        return 4
    }
}


var tr = Traingle().draw


var sq = Square().draw
