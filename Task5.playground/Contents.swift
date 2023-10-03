import Foundation

struct ScreenSize {
var height: Int;
var width: Int;
}


enum AppleDevice: CustomStringConvertible {
    case iPhone(ScreenSize, isIpad: Bool);
    case iPad(ScreenSize, isIpad: Bool);
    case macBook(ScreenSize, isIpad: Bool);
    
    
    var defineScreenSize: ScreenSize {
        switch self {
        case .iPhone(let size, _):
            return size
            
        case .iPad(let size, _):
            return size
            
        case .macBook(let size, _):
            return size
        }
        };
    
    var isIpad: Bool {
        switch self {
        case .iPad(_, let isIpad ):
            return isIpad
        case .iPhone(_, let isIpad):
            return isIpad
        case .macBook(_, let isIpad):
            return isIpad
        }
    }
    
    var description: String {
        switch self {
        case .iPhone(let screenSize, let isIpad):
            return "Model - iPhone, height:  \(screenSize.height), width: \(screenSize.width), isIpad: \(isIpad)"
            
        case .iPad(let screenSize, let isIpad):
            return " Model - isIpad, height:\(screenSize.height), width: \(screenSize.width), isIpad: \(isIpad)"
            
        case .macBook(let screenSize, let isIpad):
            return " Model - MacBook, height:\(screenSize.height), width: \(screenSize.width), isIpad: \(isIpad)"
        }
    }
    
    
}

var iphone10 = AppleDevice.iPhone(ScreenSize(height: 500, width: 400), isIpad: false)

var ipadMini = AppleDevice.iPad(ScreenSize(height: 800, width: 550), isIpad: true)

var macBookAir = AppleDevice.iPad(ScreenSize(height: 1800, width: 2300), isIpad: false)

print(iphone10)
print(ipadMini)
print(macBookAir)
