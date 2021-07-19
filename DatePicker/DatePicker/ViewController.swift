//
//  ViewController.swift
//  DatePicker
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 1초
    let timeSelector: Selector = #selector(ViewController.updateTime) //Object C 불름, objectC 메소드를 불러라
    // 함수는 updateTime을 쓸거야 ---> 만들어 줌
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 처음화면
        lblPickerTime.text = "시간을 선택하세요!"
        // 현재 시간 async -> 시간은 1초에 한번씩 바뀐게 구동되어야 함
        // ios 운영체제는 object C 로 개발되어있음
        // Timer가 어싱크ASYNC! 실행시키는 애, DateTime과는 관련 없다. 그냥 시간되면 구동시키는 애임
        // 즉 Timer는 시간을 아는 애가 아님!!! , 30분 마다 크롤링 해줘 이런식으로 할때 사용 함
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        //_> 1초에 한번씩 어떤 targer에 있는 내용들을 구동 시킬거임, (type)selector로 구동해라! , repeat= true (무한반복)
        //Timer : 일정 시간(초 단위) 후에 반복되는 기능을 할 수 있게 해줌
        // timeInterval : 반복 단위 초, selector : message가 보내지는 대상, userInfo: custom user 대부분 nil, repeat timeInterval마다 반복할 것인지 아닌지.
        // 내부 함수에 그냥 숫자로 쓰는 것 자제: 나중에 무슨 의미인지 알기 어려움 so 전역변수로 값을 받는다.


    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        // DatePicker에 있는 타임은 sender가 알고있어! (NSDate와 비슷!?)
        let datePickerView = sender
        let formatter = DateFormatter()
//        print(datePickerView)//만 하면 frame이 어쩌고 엄청 많은 데이터가 나옴
//        print(datePickerView.date) //결과 : 2021-07-20 07:41:44 +0000
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //24시간은 HH
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"

    }
    
    @objc func updateTime(){
        //objc 타입으로 컴파일 됨/ #쓴거는 @로 받아야? 하는구나!
        let date = NSDate() // Next Step
        //print(date) // 찍어보니 1초에 한번씩 구동되나 한국 시간이 아님
        let formatter = DateFormatter() // 년, 월, 일 바꿔주는 애
        // -----> NSDate, DateFormatter 둘다 생성자임 즉, 지금 인스턴스 만든거임! new 가 없을 뿐이다.
        
        formatter.locale = Locale(identifier: "ko") // 한국시간으로 나오게 해줘
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //EEE: 요일, a:am/pm, hh:mm:ss 은 시간,분,초
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))" //as Date : 타입 변경
        //NSDate는 Object C 의 Date 이므로 as Date를 통해 swift 의 Date 타입으로 변경 해줌
        
    }
        // 2개의 함수에서
//    let formatter = DateFormatter()
//    formatter.locale = Locale(identifier: "ko")
//    formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //24시간은 HH
//    가 동일하다.
    
    
    
}//ViewController

