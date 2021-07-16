//
//  main.swift
//  Day03
//
//  Created by HyoEun Kwon on 2021/07/16.
//

import Foundation

// Dictionary
// Key와 Value로 구성됨 , 순서가 없음

//var scoreDictionary: Dictionary<String, Int> = [String: Int]()
// <>안 : 제너릭
var scoreDictionary: [String: Int] = [:]  // 표준으로 많이 씀 :만 빼면 array임
scoreDictionary["유비"] = 100 // key는 유비, data는 100
scoreDictionary["관우"] = 90
scoreDictionary["장비"] = 80
print(scoreDictionary) // 결과 : ["유비": 100, "관우": 90, "장비": 80]

// 초기값을 가지는 Dictionary
let initializedDictionary: [String: String] = ["name": "James", "gender":"male" ]//String 타입, data도 String , let 이므로 변화 x
print(initializedDictionary) // 결과 : ["gender": "male", "name":"James"] 왜? 순서가 상관없으므로

// Set
// Set은 집합연산에 사용되고, 중복 데이터를 적용하지 않는다. ---> 중복데이터 있는지 체크할때 많이 씀
// 순서 없음, 순서는 무조건 array 다 !

let oddDigits: Set = [1,3,5,7,9,9,9,9,9]
print(oddDigits) // 결과 값: [7, 5, 1, 9, 3] // 중복 된 값 없이 나옴
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

// 합집합
print(oddDigits.union(evenDigits)) // 결과 값 [8, 7, 3, 5, 0, 6, 4, 1, 2, 9]
print(oddDigits.union(evenDigits).sorted()) // 결과 값 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] // 오름 차순 정리 ***

// 교집합
print(oddDigits.intersection(evenDigits).sorted()) // 결과 []

// 차집합
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted()) // 홀수에서 소수 빼기
//결과 값 : [1, 9]

// Set의 동등 비교
// 부분집합이냐, 모집합이냐 등등
let houseAnimals: Set = ["dog","cat"]
let farmAnimals: Set = ["cow","chicken","sheep","dog","cat"]
let cityAnimals: Set = ["duck","rabbit"]

print(houseAnimals.isSubset(of: farmAnimals)) // isSubset 부분집합 (house안에 farm이 들어가냐) ------ 전체 데이터가 다 들어가 있다!
print(farmAnimals.isSuperset(of: houseAnimals)) // isSuperset 모집합 (farm이 house 안에 들어 있느냐 반대로 물어 본것 뿐 )
print(farmAnimals.isDisjoint(with: cityAnimals)) // isDisjoint 완전히 다르냐

//----------> Set 으로 (DB 자료 가져 와서 )ID 중복 체크 등에 사용 가능 (isDisjoint) ---> 데이터 정리 정제 할때 Set 많이 사용

print("=======================")
//----------
// if 문!
//----------

var isCar = true
var isNew = true

if isCar, isNew{
    print("New Car")
}


isNew = false
if isCar, isNew{    // , 는 && (and) 와 같다  _ 퍼포먼스 차이 없음
    print("New Car")
}else{
    print("Old Car")
}


print("=======================")
// Switch 조건문
// Before Switch  //if 문 잘 안씀! switch가 잘되어있음

let personAge = 14
if personAge < 1 {
    print("baby")
}else if personAge < 3{
    print("toddler")
}else if personAge < 5{
    print("preschooler")
}else if personAge < 13{
    print("gradeschooler")
}else if personAge < 18{
    print("teen")
}else{
    print("adult")
}


// After using Switch statement
switch personAge{
case 0..<1:
    print("baby")
case 1..<3:
    print("toddler")
case 3..<5:
    print("preschooler")
case 5..<13:
    print("gradeschooler")
case 13..<18:
    print("teen")
default:
    print("adult")
}
//swift 는 기본이 안 흘러 내려감! break 가 기본 탑재, 흘러 내려가려면 뭔가 써 줘야함 java와 반대

let someInteger = 123456

switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
    // 숫자의 크기를 모를 때 사용 Int.max
case 101...Int.max:
    print("over 100")
default:
    print("unknown") // default 가 있어야 에러가 안걸림
}

print(Int.max) // 결과 값 9223372036854775807 (64비트 연산)
//print(Double.maximum(10.0, 20.0)) // 최대 값 찾는 거...double은 max가 없구나 알 수 있음


let aCharacter: Character = "a"

switch aCharacter{
case "a", "A": // , : or 조건
    print("The letter A")
default:
    print("Not the letter A")
}


// 국어, 영어, 수학 점수로 총점 평균을 구하고 등급을 정하기
let name = "유비"
let kor = 91 //국어점수
let eng = 97
let math = 95

var tot = 0
var avg: Double = 0

tot = kor + eng + math
avg = Double(tot) / 3  //왼쪽에 있는 타입에 맞춰야 함! so, 둘 중 하나를 더블로

// 점수 등급 출력 - 1
var grade: String

// if문을 이용한 등급 출력

if avg > 100 || avg < 0 {
    grade = "점수를 잘못 입력 하셨습니다."
}else if avg >= 90 {
    grade = "A"
}else if avg >= 80{
    grade = "B"
}else if avg >= 70{
    grade = "C"
}else if avg >= 60{
    grade = "D"
}else{
    grade = "노력하세요"
}
    
// switch case 문을 이용한 등급 출력
// grade는 위에선언되어 있는 것 사용 var grade: String , avg 도

switch avg{ // 비교대상
case 90...100: // 데이터 값 (범위)
    grade = "A"
case 80..<90:
    grade = "B"
case 70..<80:
    grade = "C"
case 60..<70:
    grade = "D"
default:
    grade = "노오력 하세요, 가망없음 "
}

// 삼항연산자 등급 출력 (/ 반복문 / 배열  다 가능)  : 띄어쓰기 잘해야함 -> 플러터는 삼항연산자 좋아함
grade = avg >= 90 ? "수" :
        avg >= 80 ? "우" :
        avg >= 70 ? "미" :
        avg >= 60 ? "양" : "가"

// 배열과 반복문
var score = [90, 80, 70, 60, 0] // 기준점
var level = ["수", "우", "미", "양", "가"]

for i in 0..<score.count{
    if avg >= Double(score[i]){
        grade = level[i]
        break;
    }
}


// 반복문

let names = ["Anna", "Alex", "Brian", "Jack"]

for i in 0..<name.count{
    print(names[i])
}

for name in names{ // 이 방법을 더 많이 쓴다.
    print(name)
}


// dictionary 반복문
let numberOfLegs = ["Spider":8, "Ant":6, "Cat":4] // dictionary는 순서가 없으므로 0,1,2 쓸수 없음
for (animalName, LegCount) in numberOfLegs{ // animalName에는 key, LegCount에는 value값이 들어가게 됨
    print("\(animalName) have \(LegCount) legs")
}

let seq1 = 1...5 //1~5까지 (...은 무조건 1씩 증가)
for i in seq1{
    print("\(i) * 5 = \(i*5)")
}

//let seq1 = 5...1 // 최소값이 더 클 수 없음! 반대로 쓰고 싶으면 reversed
// sorted도 reverse 하면 내림차순 된다.
for i in seq1.reversed(){
    print("\(i) * 5 = \(i*5)")
}
// ...은 무조건 1씩 증가 하므로, 2나 4나 5 등등 다른 수많큼 늘리고 싶다: stride
let minutes = 60 // 시계는 60분
let hourInterval = 5

//***** stride 많이 사용함!
for tickMark in stride(from: 0, to: minutes, by: hourInterval){
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: hourInterval){
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: hourInterval).reversed(){
    print(tickMark)
}


// while
var startIndex = 0
var endIndex = 100
var sum = 0

while startIndex <= endIndex{
    sum += startIndex
    startIndex += 1
}

print(sum) // 0~ 100까지의 합

// 1부터 100까지의 짝수의 합 (단 if문 사용 금지)
while startIndex <= endIndex{
    sum += startIndex
    startIndex += 2
}
print(sum)

// Exercise_05
// Enter an integer(0~9): 12345678
// Sum of digits = 36

print("Enter an integer(0~9):", terminator: " ") // 옆에다 입력 받기 : teminator
//var Num = Int(readLine()!) // 화면에 뜬거 받아오기 : readLine , readLine은 Optional 이다. --> so Optional을 풀어주자
//var inputNum = Num!
//// sum 추가
//var sumOfDigits = 0
//print(inputNum)
//print(type(of: inputNum))
//
//while inputNum > 0{
//    sumOfDigits += inputNum % 10 // 맨끝에 나머지를 저장
//    inputNum = inputNum / 10 // 123 / 10 -> 12, 이렇게 하나씩 떨어져 나가게 !
//}
//    print(sumOfDigits)

//--------------------------쌤 하신 법 : 아래
var repNum = 0
var remainder = 0
var sumNo = 0

var inpNum = Int(readLine()!)

if let _: Int = inpNum{ // i를 _ 로 사용 할 수 있음  (변수명을 안 쓸수 있음)
    // 문법상으로는 적어줘야 하는데 쓸 일이 없을 경우 _ 사용
    repNum = inpNum!
    while repNum != 0{
        remainder = repNum % 10
        sumNo += remainder
        repNum /= 10  // 나머지값은 더하기가 되고 다시 정수 만들어 주는 것
    }
    print("Sum of digits = \(sumNo)")

}else{ // 문자를 넣었거나 아무것도 안넣었을때 오류 메시지
    print("Input value is wrong!")
}
