//
//  main.swift
//  day02
//
//  Created by TJ on 2024/04/26.
//

import Foundation


//범위 연산자
for i in 1...9{
    print("2 x \(i)= \(2*i)")
}


for j in 2...9{
    for i in 1...9{
        print("\(j) x \(i) = \(j*i)")
    }
}

// 반닫힌 범위 연산자
 let names = ["Anna", "Brian", "Alex", "Jack"]
print(names.count)

for i in 0..<names.count{
    print("Person \(i+1) is called \(names[i])")
}

//논리 연산자
let allowed = false
if !allowed {
    print("Acces Denied")
}

// && , ||

// Optional
 // : 데이터가 있을수도 없을수도 있다
// : nil값을 포함 할수도 있고 안 할수도있다
let constNum: Int = 100
//constNum = nil

let optionalNum:Int! = nil
let optionalNum1:Int? = nil


// Forced unwrapping
let constNum1: Int! = 100
print(constNum1!)

// optional Binding : nil check + 안전한 값 추출
var myName: String? = nil
if let name: String = myName{
    print(name)
}else{
    print("myname is nil")
}

// guard let

func multiplyByTen(value: Int?){
    // 조건 여러개 줄수있음
    // swift 에서 , 는 and 조건
    guard let number = value, number < 10 else{
        print("숫자 너무 큼")
        return
    }
    let result = number * 10
    print(result)
}
multiplyByTen(value: 100)

// Collection
/*
 1) Array : 순서가 있는 리스트 컬렉션
 2) Dictionary : Key 와 Value의 쌍으로 이루어진 컬렉션
 3) Set : 순서가 없고 중복된 데이터가 없는 컬렉션
 */

// Array
//var intVar: Array<Int> = Array<Int>()
var intVar: [Int] = []
intVar.append(1)
intVar.append(100)
intVar.append(10)
print(intVar)
// 100 이라는 데이터가 있는지 bool 값으로 나옴
print(intVar.contains(100))
print(intVar.contains(90))
print(intVar[0])
print(intVar[0...1])

intVar.remove(at: 0)

print(intVar)
print(intVar.count)

var doubleArray: [Double] = [12,34,45,67]
var stringArray: [String] = []
var intVar2 = [1,2,3]


// 문자열 배열
var shoppingList: [String] = ["Eggs","Milk"]

for i in 0..<shoppingList.count{
    print(shoppingList[i])
}

for i in shoppingList{
    print(i)
}

if shoppingList.isEmpty{
    print("쇼핑리스트 비어있다")
}else{
    print("쇼핑리스트 차있다")
}

// 배열 데이터 추가
shoppingList.append("Four")
shoppingList += ["Baking powder", "Chocolet","Cheese","Butter"]

// 배열 데이터 수정
shoppingList[0] = "Egg"

// 특정위치 데이터 변경 및 제거
shoppingList[4...6] = ["Banana","Apple"]

// 배열의 삽입
shoppingList.insert("Mayple Syrup", at: 0)



for i in shoppingList{
    print(i)
}

// 배열의 값과 인덱스가 필요한 경우
for(index, value) in shoppingList.enumerated(){
    print(index, value)
}

// 배열의 합계 구하기 및 최대값 찾기
var tot = 0
let arr = [23,45,15,47,35,86,4,52,4,6,24]

// 합계

for i in 0..<arr.count {
    tot += arr[i]
    
}
print(tot)


// 최대값
print(arr.max()!)

// Dictionary(Map)
// Key 와 value로 구성

var score: [String: Int] = [:]
score["유비"] = 100
score["관우"] = 123
score["장비"] = 110

print(score)
print(score["유비"])
print(score.count)


//Set
var odd: Set = [1,3,5,7]
let enen: Set = [2,4,6,8]
let PrimeNum: Set = [2,3,5,7]

//합집합
print(odd.union(enen).sorted())

//교집합
print(odd.intersection(enen).sorted())

//차집합
print(odd.subtracting(PrimeNum).sorted())

//여집합
print(odd.symmetricDifference(PrimeNum).sorted())

// if 문
var isCar = true
var isNew = true

if isCar, isNew{
    print("신차")
}else{
    print("중고차")
}

// Switch 조건문

let Age = 14

if Age < 1{
    print("baby")
}else if Age < 3{
    print("toddler")
}else if Age < 5 {
    print("preschooler")
}else if Age < 13{
    print("Grandeschooler")
}else{
    print("adult")
}


// Switch

switch Age {
case 0..<1:
    print("baby")
case 1..<3:
    print("toddler")
case 3..<5:
    print("preschooler")
case 5..<13:
    print("Grandeschooler")
case  13..<18:
    print("teen")
default:
    print("adult")
    
}

let some: Character = "z"
switch some{
case "a","A":
    print("첫번째문자")
case "z","Z":
    print("마지막문자")
default:
    print("다른 케릭터")
}

let someInteger = 100
switch someInteger{
case 0 :
    print("zero")
case 1..<100:
    print("1-99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
    
}

//Tuple과 Switch 조건문

let somePoint = (1,1)

switch somePoint{
case (0,0):
    print("\(somePoint) is the origin")
case (_,0):
    print("\(somePoint) is the x-axis")
case (0,_):
    print("\(somePoint) is the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside the box")
}

let temperature = 55
switch(temperature) {
case 0...49 where temperature % 2 == 0:
    print("cold and Even")
case 50...79 where temperature % 2 == 0:
    print("Warm and Even")
case 80...110 where temperature % 2 == 0:
    print("Hot and Even")
default:
    print("ㅇㅇ")
    
}

/*
 이름, 국어, 영어, 수학, 변수를 만들고 값을 입력한 후
 총점, 평균, 등급을 계산
 */

let name = "유비"
let kor = 91
let eng = 97
let math = 95

var tot1 = kor + eng + math
var avg = Double(tot1) / 3

print("이름 : \(name)")
print("국어 : \(kor)")
print("영어 : \(eng)")
print("수학 : \(math)")
print("총점 : \(tot1)")
print("평균 : \(String(format: "%.2f",avg ))")

var grade: String


if avg > 100 && avg < 0 {
        grade = "점수 다시 확인해"
}else{
 
    if avg >= 80{
        grade = "수"
    }else if avg >= 70{
        grade = "우"
    }else if avg >= 60{
    grade = "미"
    }else if avg >= 50{
        grade = "양"
    }else if avg < 50{
        grade = "가"
    }else {
        grade = "점수 다시 확인"
    }
}


switch(avg){
case  0..<50:
    grade = "가"
case  50..<60:
    grade = "양"
case  60..<70:
    grade = "미"
case  70..<80:
    grade = "우"
case  80...100:
    grade = "수"
default:
    grade = "점수 다시 확인"
}

grade = avg > 100 ? "점수 다시 확인" : avg < 0 ? "점수 다시 확인" :
avg >= 90 ? "수" : avg >= 80 ? "우"
: avg >= 70 ? "미" : avg >= 60 ? "양" : "가"

let list: Array = ["수","우","미","양","가"]
let point: Array = [80,70,60,50,40]
var total: Int = 0

//for i in 0...100{
//    //total += Int(point[i])    if( 80  >= point[i]){
//        grade = list[i]
//    }
            
//    if( total / 3 > 100 && total / 3 < 0){
//        grade = "점수 다시 확인"
//    } else {
//
//    }
        
    
    

   
        
    
    



print("점수 등급은 \(grade) 입니다.")

// 반복문

let names4 = ["Anna","Alex","Branin"]

for name in names4{
    print("Hello \(name) ~~")
}

let numberofLege = ["spider": 8, "ant": 6, "cat": 4]
for (animalNam,legCount) in numberofLege{
    print("\(animalNam)'s have \(legCount) legs")
}

// 반복문을 통한 볌위 연산자 처리
let seql = (1...5).reversed()
for index in seql{
    print("\(index) time 5 is \(index*5).")
    
}


// 증가치 간격 조정
let minutes = 60
let minuteInterval = 5

for tickMark in stride(from: 0, to: minutes, by: minuteInterval ) {
    print(tickMark)
}


for tickMark in stride(from: 0, through: minutes, by: minuteInterval ) {
    print(tickMark)
}

let strings = ["F첫스트링","두T번째스트링","세번째스트링","네번째스트링"]

for string in strings{
    string.starts(with: "F")
    print(string)
}

for string in strings{
    if string.starts(with: "T") {
        break
    }
    print(string)
}


for string in strings{
    if string.starts(with: "T") {
        continue
    }
    print(string)
}

// while
var startIndex = 0
var endIndex = 100
var sum = 0

while true{
    sum += startIndex
    startIndex += 1
    if startIndex > endIndex{
        break
    }
}

print(sum)



var siteListD: [String : String] = ["www.naver.com" : "네이버"
                                   , "www.google.com" : "구글",
                                   "www.daum.net" : "다음",
                                   "cnn.com" : "시엔엔",
                                    "www.cbs.com" : "시비에스"]


print(siteListD.values["구글"])
