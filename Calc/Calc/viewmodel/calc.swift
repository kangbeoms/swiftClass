//
//  calc.swift
//  Calc
//
//  Created by TJ on 2024/04/29.
//

import Foundation

struct Calc{
    
    var number1 = 0
    var number2 = 0
    
    init(number1: Int = 0, number2: Int = 0) {
        self.number1 = number1
        self.number2 = number2
    }
    
    
    func add(숫자1 num1: Int , 숫자2 num2: Int) -> Int{
        return num1 + num2
    }
    
    func addProperty()->Int{
        return number1 + number2
    }
    
}
