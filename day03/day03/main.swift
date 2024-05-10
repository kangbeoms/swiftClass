//
//  main.swift
//  day03
//
//  Created by TJ on 2024/04/29.
//

import Foundation
        // 뒤에 화살표로 넘겨줄 타입을 정리
// 파라미터를 받는다
//_ 로 타입을 숨길수 있다
func integerSum(firstNum num1:Int ,secondNum num2: Int) -> Int{
        return num1 + num2
}

                //argument 를 보내고
print(integerSum(firstNum: 5, secondNum: 8))

// default

func greeting(friend: String, me: String = "조조"){
    print("Hello \(friend)! I'm \(me)")
}


greeting(friend: "유비")
greeting(friend: "장비",me:"유비")

// Ex

func addRange(start: Int , end: Int ) -> String{
   var tot: Int = 0
    for i in 1...100 {
        tot += i
    }
       return  "\(start)부터 \(end)까지의 합은 \(tot)입니다."
}

print(addRange(start:1, end:100)) // 1부터 100까지의 합은 5050입니다












//
//func decisonRange(type: String, start: Int, end: Int) -> String{
//
//    var tot: Int = 0
//    for i in start...end{
//        tot += i
//    }
//    switch(type){
//
//    case "even" where i % 2 == 0:
//
//
//        return
//
//    }
//
//
//}



//print(decisonRange(type:"even", start:1, end:10))
//print(decisonRange(type:"odd", start:1, end:10))
//print(decisonRange(type:"all", start:1, end:10))
//print(decisonRange(type:"sum", start:1, end:10))



// overlaoding : 함수의 이름은 중복되도 매개변수의 갯수로구분이 가능

func shape(_ r: Double) { //원의 면적과둘레 계산
    let pi = 3.14
    let area = pi * r * r
    let border = 2 * pi * r
    print("원: \(area), \(border)")
}

func shape(_ w:Int ,_ h: Int){ // 직사각형의 면적과 둘레 계산
    let area = w * h
    let border = 2 * (w * h)
    print("직사각형: \(area), \(border)")
    
}

func shape(_ w: Int, _ h: Int, _ i: Int) {
    let area = w * h / 2
    let border = w + h + i
    print("직각 삼각형: , \(area) , \(border)")
}
shape(5)
shape(5,4)
shape(5,5,6)

// 여러개의 return value 처리
func sizeConverter(_ length: Float) -> (yard: Float, contimeter:Float, meter: Float) {
    let yards = length * 0.0277778
    let contimeters = length * 2.54
    let meters = length * 0.054
    
    return(yards, contimeters,meters)
}

let lengthTuple = sizeConverter(20)
let (a,b,c) = lengthTuple
print(b)


// enumerate
enum Temperature{
    case hot
    case warm
    case cold
}

func displayTemperature(temp: Temperature){
    switch temp{
    case .hot:
        print(" It is hot")
    case .warm:
        print("It is warm")
    case .cold:
        print("It is cold")
    }
}

displayTemperature(temp: .hot)

enum Artithmetic{
    case addition
    case subtration
    case multiplication
    case division
    
    func perform(_ operand1: Double , _ operabd2: Double) -> Double{
        // java 의 this 와 같다
        switch self{
        case.addition:
            return operand1 + operabd2
        case.subtration:
            return operand1 - operabd2
        case.multiplication:
            return operand1 * operabd2
        case.division:
            if operabd2 != 0{
                return operand1 / operabd2
            }else{
                return Double.nan
            }
        }
    }
}

let operation = Artithmetic.addition
let result = operation.perform(10, 6)
print("Addition :\(result)")

print("Division2 : \(Artithmetic.division.perform(10, 5))")

// Struct 와 Class
// 구조체 : Swift에서 Type을 정의
struct Sample{
    var sampleProperty: Int = 10
    let fixedSampleProperty: Int = 10
    static var typeProperty: Int = 1000
    
    func instanceMethod(){
        print("instance method")
    }
    
    static func typeMethod(){
        print("type method")
    }
}

//구조체 사용
var samp: Sample = Sample()
print(samp.sampleProperty)
samp.sampleProperty = 100

var samp1: Sample = Sample()
print(samp1.sampleProperty)
samp1.sampleProperty = 100

Sample.typeProperty = 300

struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다")
    }
}

Student.selfIntroduce()
var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()


struct Resolution{
    var width = 0
    var height = 0
    
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var framRate = 0.0
    var name: String?
}

let someVideoMode = VideoMode()
someVideoMode.resolution.width = 1280

class Exam{
    var name = ""
    var score: [Int] = []
    var tot = 0, avg = 0
    
    func input(name: String, score: Int...){
        tot = 0
        avg = 0
        self.name = name
        self.score = score
        calc()
        result()
        
    }
    func calc(){
        for i in score{
            tot += i
        }
        avg = tot / score.count
    }
    func result(){
        print(name,score,tot,avg)
    }
}
let str1: Exam = Exam()
str1.input(name: "유비",score: 70,56,80)
str1.input(name: "장비",score: 70,56,80,90)

// Extension
// Extension 은 Struct, Class에 새로운 기능을 추가 할 수 있는 기능

extension Int{
    var isEven: Bool{
        return self % 2 == 0
    }
    var isOdd: Bool{
        return self % 2 == 1
    }
}

print(1.isOdd)

var number:Int = 3
print(number.isOdd)




//struct Astruct{
//    var width = 0
//    var height = 0
//
//}
//class cClass{
//    var width = 0
//    var height = 0
//}

class bClass{
    //var astruct = Astruct()
   // var getcClass = cClass()
    var width = 0
    var height = 0
    var interlaced = false
    var framRate = 0.0
    var name: String?
}

let getbClass = bClass()
//getbClass.getcClass.width = 120
//getbClass.astruct.width = 120
getbClass.width = 120
