//
//  main.swift
//  Day02
//
//  Created by HyoEun Kwon on 2021/07/15.
//

import Foundation
// 이곳은  커맨드 연습하는 곳임
var str1: String

str1 = "Apple"
str1 = "Google"
//nil은 optional 변수에만 들어감! 그래서
//str1 = nil 불가

print(str1)

var str2: String?//?대신 ! 써도 됨
str2 = "Apple"
str2 = "Google"
str2 = "123"
//str2 = nil
// nil을 넣을 수 있는 변수를 선언하겠다 : ? 사용
//print(str2)
//print(str2!)
//print(str2 as Any)


//var int1: Int = Int(str2) // 이건 optional~~ 라고 뜨기 때문에
var int1: Int = Int(str2!)! //라고 해줘 야 함 ( 변환시킬때는 !를 2개 써야 함)
print(int1)
//str2는 data만 변환, Int 같이 타입을 변환 시킬때는 다시 ! (why? 얘는 타입이 optional 이므로)

//nil을 방지하려고 만든게 optional





//비교 연산자
print(1 == 1)

// Tuple에서의 비교 연산: ()안에 데이터 들어있음
print((1,"zebra") < (2, "apple")) // tuple은 먼저 앞에 있는 값끼리 비교 : 1, 2 로 비교
print((3,"apple") < (3, "bird")) // 3 끼리 비교가 안됨 , 뒤 알파벳 순서로 비교


// 삼항 조건 연산자 (플러터에서 더 많이 쓸거임 )
let contentHeight = 40
let hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)


//범위 연산자
// 닫힌 범위 연산자
for i in 1...10{
    // 범위가 1~ 10까지다
    print(i)
}

var sum: Int = 0
for i in 1...10{  // 파이썬에서 1:10 으로 썻던 slicing 을 swift는 ... 으로 표현
    sum += i
}
print("1~10의 합계는 \(sum) 입니다.")


//------ 구구단
for i in 1...9{
    print("5 X \(i) = \(i*5)")
    
}

//배열의 length    < : 반닫힘 연산자
for i in 1..<10{
    print("5 X \(i) = \(i*5)")
}


let names = ["Anna","Alex","Brian","Jack"]

for i in 0..<names.count{
    print("Person \(i+1) is called \(names[i])")
}


//Optional
// : 값이 있을수도 있고, 없을 수도 있다.
// : nill값을 포함할 수도 있고, 포함 안할수도 있음  --> 그래서 ? 가 들어감

var constantNum = 100
//constantNum = nil //보통 데이터 타입 안정하고 데이터 넣으면 기본적 정수를 넣음! nil은 놉!--> 오류 생김

var constantNum1: Int? = 100
constantNum1 = nil // ? 나 ! 를 넣으면 nil 가능

var constantNum2: Int! = 100
//constantNum2 = nil

print("constantNum2: \(constantNum2)")  // 결과값 : Optional(100) ----> 혼자 쓸때만 !로 unwrapping 할지 안할지 정해야 함
print(constantNum2 + 10) // 결과값 : 110 --- 다른 정수와 함께 쓰면 알아서 unwrapping 됨


//Optional Unwrapping(풀자!)
var myName: String? = nil // nil값이 있을수도 잇어!
print(myName as Any) // 경고뜨면 fix 잘 활용 하자 // 결과 값: nil

//Optional Binding : ! 없이 optional 없애는 법! (! 쓰는건 force! 강제로 없애는 것)
if let name: String = myName{
    print(name)
}else{//nil이면 else로 가고 nil아니면 위로감
    print("myName is nil") // 현재 위에 선언된 myName 변수가 nil 값이므로 else로 와서 결과 값이 myName is nil 로 나옴
    //요렇게 한뒤로는 ! 없어도 됨...????
}
//이게 if let 인데 요즘은 guard let 많이 씀


var yourName: String! = nil // ?나 ! 는 같음  // nil 가능

//Optional Binding : ! 없이 optional 없애는 법! (! 쓰는건 forced! 강제로 없애는 것)
if let name: String = yourName{
    print(name)
}else{//nil이면 else로 가고 nil아니면 위로감
    print("yourName is nil")
}

//if let 2번 써야하나?-> 아님!
var myName2: String? = "James"
var yourName2: String? = nil

if let name = myName2, let friend = yourName2{
    print("\(name) and \(friend)") // yourName2든 둘중 하나를 nil값으로 정해주면 값이 안나옴
    //...는 다 and 기법 ..!?
}


// Force Unwrapping (Force라고 나쁜것 아님) ---> 더 많이 씀
print(myName2) // 결과값 : Optional("James") 없애려면 print(myName2!) 해야 결과 값이 James 라고 나옴
myName2 = nil
//print(myName2!)//data가 들어왔는지 안들어왔는지, 통과 된다음에 ! (Force Unwrapping)써야해 nil 인채로 출력하면 심각한 오류
print(myName2 as Any) // nil 출력 가능!



//------------------------------------- **
// Collection : 여러 값들을 묶어서 하나의 변수로 사용

/*
  Array: 순서가 있는 리스트 컬렉션  *** java에서의 arraylist
  Dictionary : Key와 Value의 쌍으로 이루어진 컬렉션
  Set : 순서가 없고 멤버가 유일한 컬렉션, 집합연산
 */

// Array
// 빈 Array 생성
// let 으로 array 생성하면 그 array는 변경 불가
   
    //여러 선언 방법
//var intVariable: Array<Int> = Array<Int>()  // var intVariable: class = 생성자
//var intVariable: [Int] = [Int]() //위의 것과 같음
var intVariable: [Int] = [] // 제일 많이 쓰는 방법 Int 타입 배열이야
intVariable.append(1)
intVariable.append(10)
intVariable.append(100)
intVariable.append(1000)

print(intVariable) // 결과 값[1, 10, 100] // 넣은 순서대로 들어감! array는 순서가 있음!
print(intVariable.contains(100)) //100을 가지고 있니?-> T/ F : ----> 결과 true
print(intVariable.contains(90)) // 결과 : false

print(intVariable[0])//0번째 알려줘!
print(intVariable[0...2]) // 0~ 2 번째 데이터 들을 알려줘 결과: [1, 10, 100]
print(intVariable[0...2][0]) //1차원 배열 / 0~2 번째에서도 0번째 애를 알려줘 ~ 결과: 1

intVariable.remove(at: 0) // 0번째꺼 지울게
print(intVariable) // 결과 : [10, 100, 1000] //0번째 지워짐
intVariable.removeLast() // 제일 마지막꺼 지워줘
print(intVariable)
intVariable.removeAll() // 다 지워줘
print(intVariable) //결과 : []

intVariable = [] // 아무것도 없는걸 넣어줘 즉, 다 지우는 것 위와 같음

// 기본값으로 배열 생성하기
//0.0을 3번 만들어줘! (10000개를 만들 수도 있으므로 ) -> flutter 가 쉬움
// 생성자를 Dictionary 로 만든다 (최신)
var threeDouble = Array(repeating: 0.0, count: 3) //class는 생성자를 가지고 있지! 대문자로 시작하므로 class
print(threeDouble)
var anotherDouble = Array(repeating: 2.5, count: 3)
var sixDouble = threeDouble + anotherDouble // +는 +가 아니야! for문으로 돌려야 더하기..! 얘는 배열을 합치는 것
print(sixDouble)

let intVariable2 = [1,2,3]  //data가 들어있으므로 : [Int] 할 필요 없어! 알아서 정해줌
print(type(of: intVariable2)) // 결과: Array<Int>
//intVariable2.append(4) //하면 에러 걸림! 왜? let 으로 정해줬기 때문에 변경 불가!
// 그냥 무조건 일단 var로 쓰고 나중에 fix !, optional 인지 아닌지 고민도 x

var shoppingList = ["Eggs", "Milk"] //String 배열
print(shoppingList.count)// 결과 : 2
if shoppingList.isEmpty{ //비어있니?  isEmpty , count == 0 둘다 사용 가능 //swift의 string은 클라스 string이므로
    
}
//append 좋은데.. data100개면? append 100개 써야 함
shoppingList += ["Baking Power"] // 더하기가 추가임!
shoppingList += ["Chocolate","Cheese","Butter"]
print(shoppingList) // 결과 : ["Eggs", "Milk", "Baking Power", "Chocolate", "Cheese", "Butter"] 0~5까지 들어감


// 배열의 특정 위치 데이터 변경 및 제거
//shoppingList[0...3] = ["Banana"] // 0~3 번째가 다 Banana로 변경 됨 !
print(shoppingList) // 결과 : ["Banana", "Cheese", "Butter"]

shoppingList[0...3] = ["Banana1","Banana2","Banana3","Banana4","Banana5","Banana6"] // insert 됨
print(shoppingList) //["Banana1", "Banana2", "Banana3", "Banana4", "Banana5", "Banana6", "Cheese", "Butter"]

shoppingList.insert("Apple", at: 0) // 0 번에 Apple 넣어줘!
// _ 를 쓰면 변수명 안보이고 현재 at이라는 변수명 보임
print(shoppingList)

// 배열의 값과 인덱스가 필요한 경우
for (index, value) in shoppingList.enumerated(){ //번호와 데이터를 같이 받을거야 // enumerate : 열겨
    print("Item \(index+1): \(value)")
}

print(shoppingList.enumerated()) //결과 값: EnumeratedSequence<Array<String>>(_base: ["Apple", "Banana1", "Banana2", "Banana3", "Banana4", "Banana5", "Banana6", "Cheese", "Butter"])


//print(sixDouble) 이용
var tot = 0.0
for i in sixDouble{ // data값이 오는 거임 index 값이려면 0...이렇게 와야함
    tot += i
}
print(tot) //결과: 7.5

// 최대값 찾기
print(sixDouble.max()) //결과: Optional(2.5)
// 최소값 + Optional 풀기
print(sixDouble.min()!) // 결과: 0.0

// 배열 배웠으니 무한 반복 해보자! (emoji)
