//
//  main.swift
//  Day04
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import Foundation

//***************
// 함수
//***************
//: 처음부터 함수를 정하는 경우는 거의 없다.

// 함수에 쓰는 변수는 Argument , 불러와서 쓸때는 Parameter

func interSum(a: Int, b: Int) -> Int{ // 숫자 2개를 받을거야 변수이름은 a, 타입은 Int , 다른하나 변수이름 b (Argument)
    //결과 값도 Int!  없으면 안쓰거나, -> Void 라고 써도 됨
    // () 로 변수를 받아서 -> 로 값을 준다.
        return a + b
}

//var abSum = interSum(a: 5, b: 8) //tab으로 각각의 값을 넣어 줄 수 있다.
//print(abSum)
print(interSum(a: 5, b: 8))  // 변수지정은 최대한 하지 말자! 변수는 메모리에 무조건 올라가므로 안쓰는게 더 좋음 (Parameter)

// 다른 예제
func greet(person: String) -> String {
    let greeting = "Hello, \(person)"
    return greeting // return 이니까 자체적으로 값을 보여주지 않고 넘겨줌
}
print(greet(person: "Anna"))

// Argument 가 필요없는 함수
func sayHelloWorld() -> String {
    return "Hello, World!"
}

print(sayHelloWorld())

func buildAddress(_ name: String, address: String, city: String, 우편번호 zipCode: String, country: String? = "USA") -> String {
    //?를 안쓰면 무조건 default 값인 USA 만 나옴, ? 넣으면 nil 값 OK
    
   // func buildAddress(_ name: String, address: String, city: String, 우편번호 zipCode: String, country: String) -> String {

    // 문자니까 가능  return 이 string 값으로 뭉치로 넘어감 (어레이없어도 가능!)
    return """
        \(name)
        \(address)
        \(city)
        \(zipCode)
        \(country ?? "") // nil이라고 입력시 빈칸
        """
}
// name 이라는 변수를 보여주기 싫어! 그러면? 함수에 _ (underbar, blakchole) : _ 뒤 한칸 띄기
// zipcode를 다르게 보여주세여 한칸띄어쓰기 (우편번호 zipcode) -> 함수를 사용하는 사용자에게는 우편번호라 보임
print(buildAddress("이순신", address: "한국", city: "서울", 우편번호: "123", country: "Korea"))
print(buildAddress("유비", address: "중국", city: "북경", 우편번호: "234"))
print(buildAddress("장비", address: "중국", city: "상하이", 우편번호: "123", country: nil))


// 가변 매개변수
func sayHelloFriends(me: String, friend: String...) -> String {
    //friend: String... (기타 등등 더 있어! 즉, friend 값을 여러개로 넣을 수 있게 됨(list로 담김)
    return "Hello \(friend)! I'm \(me)😄"
}

print(sayHelloFriends(me: "제니", friend: "아이유", "태연")) //결과 : Hello ["아이유", "태연"]! I'm 제니😄


// 복수의 값을 반환하는 함수 **많이 쓰심
// argument를 tuple로 넣어주기
func getCountry() -> (dialCode: Int, isoCode: String, name: String){
    let country = (dialCode: 82, isoCode: "KR", name: "Korea")
    return country
}

let ret = getCountry()
print(ret) //결과 (dialCode: 82, isoCode: "KR", name: "Korea")
// 나는 튜플중 하나만 쓰고 싶어! . 으로 사용 가능
print(ret.dialCode) // 결과 82




//시작 숫자부터 끝 숫자까지의 합계를 구하는 함수
// 사용자는 print(addRange(start:1, end:100)) 으로 입력 하고 싶다
// 결과 값: 1부터 100까지의 합은 5050입니다. -> 이때의 함수를 만들어 보기

//1) for문
func addRange(start: Int, end: Int) -> String {
    var sum: Int = 0
    for i in start...end{
        sum += i
    }
    return "\(start)부터 \(end)까지의 합은 \(sum)입니다."
}

//2) while문
func addRange2(start: Int, end: Int) -> String {
    var sum2: Int = 0
    var i = 0
    while i<=end{
        sum2 += i
        i += 1
    }
    return "\(start)부터 \(end)까지의 합은 \(sum2)입니다."
}

print(addRange(start: 1, end: 100))
print(addRange2(start: 1, end: 100))



// Overloading: 함수의 이름은 중복되도 parameter의 갯수로 구분이 가능

// 도형의 면적과 둘레를 구하는 함수
// 원의 둘레 : 2파이r , 면적: 파이r제곱
// 원
func shape(_ r: Double){
    let pi = 3.14
    let area = pi*r*r // 파이r제곱
    let border = 2 * pi * r
    print("원 : \(area), \(border)")
}

// 직사각형
func shape(_ w: Int, _ h: Int){
    let area = w * h
    let border = (w + h) * 2
    print("직사각형 : \(area), \(border)")
}

// 직각 삼각형
func shape(_ u: Double,_ h: Double,_ k: Double){
    let border = u + h + k
    let area = (u + h + k ) * 0.5
    print("직각삼각형 : \(area), \(border)")
}

shape(5)
shape(5, 6)
shape(5, 6, 7)

//swift는 function 단위이다!

//image (전구 on/off) -> image확대 축소! ? 이미지가 커지는게 아니고 frame이 커지는 것!



//************************************************

// ------------------swift 실전!
// class ViewController: UIViewController : class 클라스이름: 상속 -> swift는 다중 상속 가능

/*/
 
** Class: 전통적인 OOP(Object Oriented 객체 지향) 관점에서의 클래스
 - 단일 상속
 - property
 - constructor
 - method : swift에서 function 형태로 사용
 - 참조 타입 선언

 
** Struct (구조체)
 - 상속 불가
 - property
 - constructor
 - method : swift에서 function 형태로 사용
 - 값(Value) 타입 선언 (Call by Value)

 */

// Class와 Struct의 비교
//struct <#name#> {
//    <#fields#>
//}
struct ValueType {
    var property = 1
}

class ReferenceType{
    var property = 1
}
// Class 사용
// Class 이름 obj 이름 = new Constructor 이름  으로 java에서 사용 했었음(OOP 관점이므로 인스턴스 필요)

//struct의 인스턴스 만들기
//let firstStructInstance = ValueType() 도 가능하다 아래모양이 원래 모양
let firstStructInstance: ValueType = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first : \(firstStructInstance.property)") // first : 1
print("second : \(secondStructInstance.property)") //second : 2
// 쌍둥이로 만들어도(복제했을 경우) 각각의 값은 다르다 --> 그러므로 상속 불가.

// Class 인스턴스
let firstClassInstance: ReferenceType = ReferenceType()//오른쪽: ReferenceType의 생성자
var secondClassInstance = firstClassInstance
secondClassInstance.property = 2
// 쌍둥이를 만들었을때(복제했을 경우) 값이 동일해짐!

print("first : \(firstClassInstance.property)") // first : 2
print("second : \(secondClassInstance.property)") // second : 2
//second에만 값을 줬는데 1도 바뀜0
