//
//  main.swift
//  day04
//
//  Created by TJ on 2024/04/30.
//

import Foundation

// function
func sumFunction(num1:Int, num2:Int) -> Int{
    return num1 + num2
}

var sumResult: Int = sumFunction(num1: 10, num2: 20)
print(sumResult)

//Closure
var sumClosure = {
    (num1: Int, num2: Int) -> Int in
    return num1 + num2
}

sumResult = sumClosure(10,20)
print(sumResult)

