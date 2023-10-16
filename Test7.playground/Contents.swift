import UIKit


class Transport {
    var brand: String
    public var speed: Double
    internal var wheels: Int
    fileprivate var isMoving: Bool = false
    
    
    init(brand: String, speed: Double, wheels: Int) {
        self.brand = brand
        self.speed = speed
        self.wheels = wheels
    }
    
    convenience init(brand: String) {
        self.init(brand: brand, speed: 0, wheels: 0)
    }
    

    func move() {
        isMoving = true
        print("\(brand) with speed:  \(speed)")
    }
    
    private func setSpeed(speed: Double) {
        self.speed = speed
    }
}


class Car: Transport {
    var numDoors: Int
    
    
    override init(brand: String, speed: Double, wheels: Int) {
        self.numDoors = 4
        super.init(brand: brand, speed: speed, wheels: wheels)
    }
    

    override func move() {
        print("\(brand) car mooves with \(speed) and have: \(numDoors) dors")
    }
    
    func honk() {
        print("honk")
    }
}


class Bicycle: Transport {
    var hasBasket: Bool
    
    init(brand: String, hasBasket: Bool) {
        self.hasBasket = hasBasket
        super.init(brand: brand, speed: 20, wheels: 2)
    }
    
    override func move() {
        print("\(brand) bicycle mooves with \(speed) speed and \(hasBasket ? "has a basket" : "doesn`t have a basket")")
    }
    
    func ringBell() {
        print("ring-bell")
    }
}


let myCar = Car(brand: "Toyota", speed: 60, wheels: 4)
myCar.move()
myCar.honk()

let myBicycle = Bicycle(brand: "Schwinn", hasBasket: true)
myBicycle.move()
myBicycle.ringBell()

