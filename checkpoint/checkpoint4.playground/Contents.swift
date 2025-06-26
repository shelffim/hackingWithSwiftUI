import UIKit

enum sqrtError:Error {
    case minBound,maxBound, noRoot
}

func isSqrt(_ i:Int) throws -> Int {
    
    if i < 1 {
        throw sqrtError.minBound
    }
    
    if i > 10_000 {
        throw sqrtError.maxBound
    }
    
    for j in 0...100 {
        if j * j == i {
            return j
        }
    }
    
    throw sqrtError.noRoot
}

do {
    let result = try isSqrt(25)
    print(result)
} catch sqrtError.noRoot{
    print("no root")
} catch sqrtError.minBound{
    print("less than 1.")
} catch sqrtError.maxBound{
    print("greater than 10000.")
}
