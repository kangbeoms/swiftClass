//
//  main.swift
//  day01
//
//  Created by TJ on 2024/04/25.
//

import Foundation

print("Hello, World!")
print("안녕하세요")
print(1234)
print("123+ 456=", 123+456)
print("🫅🏼")

// 상수
let messege = "Hello world"
//messege = "123"
print(messege)

//변수
var messege1 = "Hello world"
messege1 = "world"
print(messege1)

//상수나 변수 선언 방법
/*
 let <variable name>: <type>= <value>
 */
    // swift 에서타입은 전부대문자시작
    //변수를잡을때 초기값이 있거나 없어도된다
let intLetNum1: Int
let intLstNum2 = 300

var intVarNum1: Int = 500
//intLetNum = 1000

let inputA = 100
let inputB = 100
let sum: Int

sum = inputA + inputB
print(sum)

var nickName: String
nickName = "유비"
nickName = "장비"
print(nickName)

//한 줄에 동시선언
var aNum = 9, bNum = 10

//문자열 보간법 (String Interpolation)
let studentName = "홍길동"

//출력방법
print("name :" ,studentName)
print("Name :" + studentName)
print("Name : \(studentName)")

//Ex)
let age: Int = 10

//age 변수를 활용하여 "저는 10살 입니다" 라고 출력하는 문장을 작성하기
print("저는 \(age)살 입니다")

// print문 하나로 "저의 형은 14살 입니다. 라고 출력하는 문장 작성

print("저의 형은 \(age + 4)살 입니다")
// 초코파이
var price = 300
var cnt = 5
var total = "초코파이 가격은 \(price)원 이고 수량은 \(cnt)이며 헙계는 \(price * cnt)"

//초코파이 가격은 300원 수량은 5 합계는 1500원입니다라고출력하기

print(total)

/*
 기본 데이터 타입
  : bool.Int, UInt, Float, Double, Charactor, String
 */

//Boll
var someBool:Bool = true
someBool = false

// Int
var someInt: Int = -100
//someInt = 100.1
someInt = 100_000
someInt = 100_000_000
print(Int.max)

//UInt
var someUInt: UInt = 100
print(UInt.max)

//터압아 툴라면 넣을수없다
//someInt = someUInt


//Float
var someFloat: Float = 3.14
// 변환가능 (묵시적변환)
someFloat = 3
someFloat = 10_000.44_928

//Double
var someDouble: Double = 3.14
someDouble = 3

print(type(of: 123.456))

// 숫자 type 변환
let doubleNum = 3.9999

var castToint = Int(doubleNum)
var roundToInt = Int(doubleNum.rounded())

print("Origin : \(doubleNum),After cast : \(castToint), After rounded : \(roundToInt)")

// Character
var someCharacter: Character = "A"
someCharacter = "가"
someCharacter = "🤔"

//String
var someString: String = "바바바🤔 "
someString += "웃으면 복이와요"
print(someString)

someString = """
           12345
                    asdff
                                가나다라마
"""
print(someString)

//문자열과 특수문자
print("aa\t\tbb\n\ncc")

// 출력시 "" 를 표시
let wiseworld = "\"Imagination is more important than knowlege\"-adsd"
print(wiseworld)

let name: String
let size: Int
let weight: Double
let bag: Bool
let color: Character

name = "맥북프로"
size = 16
weight = 2.56
bag = false
color = "백"

//문자열의 결합
let string1 = "Hello"
let string2 = "there"
var welcome = string1 + string2
print(welcome)

var instruction = "look over"
instruction += string2
print(instruction)

let extra: Character = "!"
//welcome += String(extra)
welcome.append(extra)


//-----------------------
let multiplier = 3
let messege2 = "\(multiplier) times .25 is \(Double(multiplier) * 2.5)"
print(messege2)
let str = "12345.6789"
print("str has \(str.count) characters")

if(str.count == 0) {
    print("Data 없음")
    
}else {
    print("Data는 \(str) 입니다")
    
// --------
// Any : Swift 의 모든 type 을 지칭하는 키워드
// nil : 없음을 의미하는 키워드
    
// Any
    var someAny: Any = 100
    someAny = "어떤타입도 수용 가능"
    someAny = 123.12
    //Any 의 타입변환은 as 로 실행 ( Any 가 상위 타입이라)
    var someAny1: Double = 234.15
    print(someAny as! Double + someAny1)
    
// ------
// Tuple
    var diaCode1 = 82
    var isoCode1 = "KR"
    var name1 = "Korea"
    
    print(diaCode1,isoCode1, name1)
    
    //Tuple 사용
    var country = (82, "KR", "Korea")
    print(country.0, country.1,country.2)
    
    var country1 = (diaCode1:82, isoCode12: "KR", name12: "Korea")
    print(country1.diaCode1, country1.isoCode12, country1.name12)
    
    let person = (name2: "John Doe", address2: "301 Fifth Avenue", age2: 35)
    
    print("\(person.name2) lives at \(person.address2) and is \(person.age2) years old")
    
    //Tpye Alias
    
    typealias MyInt = Int
    typealias yourInt = Int
    typealias MyDouble = Double
    
    let age1: MyInt = 20
    let year: yourInt = 2020
    
    typealias person1 = (name: String, height: Int, marriage: Bool)
    
    var t1: person1 = ("유비",180,true)
    
    print(t1.name)
    
    // Tuple 을 사용하여 직사각형의 넓이와 둘레구하기
    //직사각형 속성 : 이름,가로,세로,둘레,넓이
    //넓이 = 가로 * 세로
    //둘레 = (가로 * 세로) * 2
    
    typealias Rectangle = (name: String, w: Int ,h: Int, area: Int, border: Int)
    
    var r1: Rectangle = ("직사각형1", 5,6,0,0)
    var r2: Rectangle = ("직사각형2" ,15,7,0,0)
    
    r1.area =    r1.w * r1.h
    r1.border =  (r1.w * r1.h) * 2
    r2.area =   r2.w * r2.h
    r2.border =   (r2.w * r2.h) * 2
    
    print(r1)
    print(r2)
}


//연산자

print(1+2)
print(1-2)
print(1*2)
print(1/2)
print(1/2.0)
print(1%2)

let one = 1
let minusOne = -one
let plusOne = -minusOne

//Tuple 할당연산
let (x1, x2) = (1, 2)
let (y1, y2) = (3, "Kim")

//-------비교 연산자-------
    // Tuple 은 비교할때 첫번째게 결정나면 뒤에껀 실행 x
print((1, "zebra") < (2, "apple"))
// 문자열은 알파벳 순서대로 비교한다
print((3, "zebra") > (3, "apple"))


//일반 조건 연산자
let contentHeight = 40
let hasHeader = true
var rowHeight: Int

if(hasHeader) {
    rowHeight = contentHeight + 50
}else {
    rowHeight = contentHeight + 20
}


//삼항조건 연산자
rowHeight = contentHeight + (hasHeader ? 50 :20)

// nil 병합 연산자
let defaultColorName = "red"
// nil 사용가능 변수
var user: String?

var colorName = user ?? defaultColorName
print(colorName)

// 범위 연산자
var sum1: Int = 0
for i in 1...10{
    sum1 += i
}
print("1 ~ 10 까지의 합계는 \(sum1)입니다")
