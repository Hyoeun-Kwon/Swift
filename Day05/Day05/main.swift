//
//  main.swift
//  Day05
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import Foundation

//class 와 동일하게 사용, 다만 상속 불가
//------------------
// 구조체: Structure
// : Swift에서 Data Type을 정의 시 많이 사용

//Structure 생성
struct Sample{
    var sampleProperty: Int = 10 // 가변 프로퍼티
    let fixedSampleProperty: Int = 100 // 불변 프로퍼티
    // static 메모리 많이 먹으니 안쓰는게 좋다? 옛날 이야기 임
    static var typeProperty: Int = 1000 // 타입 프로퍼티
    // 자바에서 했던 필드가 프로퍼티 임
    
    //-------------비어있는 생성자: init
//    init() {
//
//    }
    //-> 아무것도 안적으면 알아서 빈 생성자 하나 만들어 줌
    
    func instanceMethod(){
        print("instance method")
    }
    
    //static function 많이는 안쓰지만 만들 수 있음
    static func typeMethod(){
        print("type method")
    }
    //static -> 이름 그대로 Sample. 으로 불러오고
    //static이 아닌 것은 인스턴스를 생성하여 쓴다.
    
}//struct




// Structure 사용

var samp: Sample = Sample() // 생성자 이름과 클라스 이름 쓰게 되어있음
// samp 라는 인스턴스 하나 생성
//보통 생략하여 (타입은 알아서 정해주므로) var samp = Sample() 라고 적기도
print(samp.sampleProperty) // 결과 값 : 10
// samp. 하면 static 인것 빼고 쓸 수 있게 나온다.
samp.sampleProperty = 100
print(samp.sampleProperty) // 결과 값 : 100

// Class는 화면 하나다, 그 외에것은 Structure로 만드는 것이 퍼포먼스가 좋다.

//새로운 인스턴스 생성
var samp1 = Sample()
print(samp1.sampleProperty) // 결과 값 : 10
// 새로운 인스턴스 samp1 만들면 데이터가 각각 다르다! Call by Value


// Type Property
Sample.typeMethod()
print(Sample.typeProperty) // 결과 값: type method
// static 인건 원래 이름 대로 써야 한다.


// 학생 구조체
struct Student{
    var name: String = "unknown"
    var `class`:String = "Swift"
    // class 같이 기본 지정언어, 키워드 등은 변수로 쓸수 없는데 쓰고 싶으면`를 사용하여 쓸 수 있게 한다.
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce() //대문자Student 사용시 static 사용 가능// 결과 값 :학생 타입 입니다.

var student: Student = Student()// 인스턴스 생성
student.name = "James"
student.class = "스위프트"
student.selfIntroduce() //결과 값: 저는 스위프트반 James입니다.


let cathy: Student = Student()
//cathy.name = "Cathy" // 불가! let은 바꿀 수 있는게 없다. name이 var 여도..안됨!!
cathy.selfIntroduce() //를 찍는 거 밖에 못 함 // 결과 값: 저는 Swift반 unknown입니다.

//기능 확장...!?

//*******Class로

// 학생 구조체 Class // 똑같음!! 그대로 가져와서 class로 변경 하면 됨
class Student1{
    var name: String = "unknown"
    var `class`:String = "Swift"
    // class 같이 기본 지정언어, 키워드 등은 변수로 쓸수 없는데 쓰고 싶으면`를 사용하여 쓸 수 있게 한다.
    
    static func selfIntroduce(){
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce(){
        print("저는 \(`class`)반 \(name)입니다.")
        print("저는 \(self.class)반 \(name)입니다.")// `` 사용 대신 self. 사용 가능
    }
}

Student1.selfIntroduce() // 결과 값: 학생 타입 입니다.
//인스턴스 생성도 똑같음.
var student1: Student1 = Student1()


//============================
class Shape{
    let pi = 3.14
   
    func input(_ r : Double){
        let area = pi * r * r
        let border = 2 * pi * r
        print("원의  면적은 \(area)이고 둘레는 \(String(format:"%2.f",border))이다.")
    }
    
    func input(_ w: Int , _ h: Int){
        let area = w * h
        let border = (w + h) * 2
        print("직사각형의  면적은 \(area)이고 둘레는 \(border)이다.")
    }
   
    func input(_ bt : Double, _ w: Double, _ h: Double){
        let area = (bt + w + h) * 0.5
        let border = bt + w + h
        print("직각삼각형의  면적은 \(area)이고 둘레는 \(String(format:"%2.f",border))이다.")
    }
}

let sh1: Shape = Shape()
let sh2: Shape = Shape()
let sh3: Shape = Shape()

sh1.input(5) //원의 면적과 둘레 구하기

// 원의 면적은 __이고 둘레는 __ 입니다.
sh2.input(5, 6) // 직사각형의 면적과 둘레 구하기
sh3.input(5,6,8) // 직각삼각형의 면적과 둘레 구하기



// 생성자 통해 계산
class Shape1{
    var area = 0.0
    let pi = 3.14157
    var kind = ""
       
    //비어있는 생성자
    init() {
        print("계산 시작")
    }
    
    //생성자를 통해서 계산 할 수도있고, 함수를 통해서도 가능
    init(radius: Double) {
        area = radius * radius * pi
        kind = "원"
        calc()
    }
    
    //원의 면적 함수
    func input(r: Double){
        area = r * r * pi
        calc()
    }
    
    
    // 직사각형, 직각삼각형 구해보기
    init(width: Int , height: Int) {
        area = Double(width * height)
        kind = "직사각형"
        calc()
    }
    
    init(base: Int, height: Int ) {
        area = Double(base * height) * 0.5
        kind = "직각삼각형"
        calc()
    }
    
    func calc(){
        print("\(kind)의 면적은 \(Int(area))입니다.")
    }
}

let sh4 : Shape1 = Shape1() //결과 값: 계산 시작 , 비어있는 생성자가 불러와짐
//sh4.input(r: 5.0)


let sh5: Shape1 = Shape1(radius: 5.0) //결과 값: 원의 면적은 78입니다.

// 생성자로 계산: 직사각형, 직각삼각형
let sh6: Shape1 = Shape1(width: 5, height: 6) //결과 값: 직사각형의 면적은 30입니다.
let sh7: Shape1 = Shape1(base: 6, height: 8) //결과 값: 직각삼각형의 면적은 24입니다.



// 대상이 스마트폰이므로 메모리 중요!


//=================고급 기능===================
// Extension(확장) *********!!!!!! 꼭! (상속대신 swift5 부터는 extension을 많이 씀)
// 구조체, 클래스, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능
// 기존에 존재하는 기능은 재정의 할 수 없다. (새로운 기능만 추가 가능)

// 구조체니까 확장 ok..!?
extension Int{ // Int 기능 확장
    var isEven: Bool{
        return self % 2 == 0 // self: 들어 온 값이 짝수인가?
    }
    
    var isOdd: Bool{
        return self % 2 == 1
    }
    
}// extension

print(1.isEven) // 결과 값: false
// 따로 class 만들어서 상속하느니 extension이 더 편하다.

// extension과 꼭 같이 다니는 애 : Delegate(대리자)
// extension 은 class 안에 존재하는게 아니고 따로 존재함 so, delegate 중요 (extension 과 class를 연결 )

// Quiz _ pickerView




// Closure : 이름 없는 함수 (이런게 있다.ios 에서는 closure 딱! 한군데 사용 : Alert Message 만들때 사용)
// 한번만 쓰는 함수, 나만 쓰는 함수 파이썬: Lamda 함수와 같음

// 함수 (숫자 2개 받아서 쓰는 함수)
func sumFunction(a: Int , b: Int) -> Int{
    // -> 가 있으면 return
    return a + b
}

var sumResult: Int = sumFunction(a: 10, b: 20)
print(sumResult) // 결과 값: 30

// 위의 기능을 Closure로 만들기
//func 아니고 var
var sumClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    // code는 in 뒤에 씀, 그 앞은 function에 대한 type 정한것
    // in 만 기억!! **
    return a + b
}
sumResult = sumClosure(10, 20)
print(sumResult) // 결과 값: 30

// Alert, Action Sheet 를 이해하기



//--------랜덤
//print(Int.random(in: 1..<10))
//print(Int.random(in: 1..<10))

func genNum() -> String{ //label은 string이므로!
    return String(Int.random(in: 1..<10))
}

print(genNum())
