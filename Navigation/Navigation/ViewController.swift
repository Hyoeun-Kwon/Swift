//
//  ViewController.swift
//  Navigation
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {
    //Navigation 안 button 에 action 안줘도 알아서 넘어감!
    
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    
    //image 만들어주기
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    // 상태 변수 (전구가 켜있는지 꺼있는지 : 처음: 켜져있음) _ 상태변수는 보통 bool값임
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기 화면
        // 켜진 화면 넣기
        imgView.image = imgOn
          
    }
    
    
    //세그에 대한 정보 가져오기(수정화면에서 어느 segue를 통해 온것인지 알기 위함_ button인지 Bar button인지 )
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //내가 쓸거야 라고 정의를 해준다.
        //segue와 연결되어 있는 애야.(segue: 함수이름)
        // 어디에 있는 연결자다! / segue를 통한 인스턴스 생성
        let editViewController = segue.destination as! EditViewController //java 에서의 인스턴스  : EditViewController로 연결
        //인스턴스를 만들어서 인스턴스에 값을 준거임 EditViewController는 클래스임! 
        // 화살표 방향: destination 임
        
        //띄어쓰기 주의
        if segue.identifier == "editButton"{
            //EditViewController에 data가 있어야 함 (받아주는애가 있어야해)_ > 변수 만듬 : textWayValue
            editViewController.textWayValue = "Segue: Use Button!"
        }else{
            editViewController.textWayValue = "Segue: Use Bar Button!"
        }
        
        //-------------------------text field 값 처리
        // View Controller에서 적은 텍스트 필드 값을 수정화면의 텍스트 필드로 값넘기기
        
        editViewController.textMessage = tfMessage.text!
        
        //*****
        editViewController.delegate = self //<<<<< //연결되어있다! _ 권한을 준것
        //self: ViewController
        //prepare만이 EditViewController와 연결 되어 있음
        
        // 전구
        editViewController.isOn = isOn //(self.isOn) // 나의 isOn이 editViewController의 isOn으로 전달
        
    }//prepare
    
}//ViewController

// 뒤에있는 애가 함수를 실행한뒤 빠짐 
// segue를 실행할때 extension이 있어야함
//extension에 내가 만든 코드 넣기 ( delegate에서 만든 것)
// 뒤에서 전구 껏으면 앞에서 전구 끈 모양으로 바뀌어야 하므로 ( 여기서 변화가 일어나므로 여기에 extension 함
// 거꾸로 오는건 그냥 올수 없으므로 프로토콜을 통해서 오는 것임
extension ViewController: EditDelegate{
    // 수정
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
    }
    
    // 전구 image
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
}
