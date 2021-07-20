//
//  ViewController.swift
//  Alert
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lampImage: UIImageView!
    
    //2. 이미지 넣어 둔 변수를 만들어서 그 변수를 불러오자: 빠름 _ 그림 만들어짐
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    
    var isLampOn = true // 상태변수 : Lamp State (초기 상태 :켜있음)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 초기화면
        lampImage.image = imgOn
        
    }
    


    @IBAction func btnLampOn(_ sender: UIButton) {
        //3. 램프가 켜있니
        if isLampOn { // 켜있는데 켜겠다. 하면 경고 메시지
            //true: 켜있는 상태
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 켜져있는 상태입니다.", preferredStyle: .alert)
            let OnAction = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: nil)
            
            // 붙여주기
            lampOnAlert.addAction(OnAction)
            // 화면
            present(lampOnAlert, animated: true, completion: nil)
            //animated true와 false 가 다르다. (false는 팍! 뜨는 느낌)
            
        }else{
            //꺼져 있는 상태 일 경우 램프 켜고, 상태를 켜져있다고 알기
            lampImage.image = imgOn
            isLampOn = true
        }
    }
    
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            //끄기 눌를때 켜있는 상태면? -> 알람뜨고  꺼주기
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄겠습니까", preferredStyle: .alert)
            let OffYAction = UIAlertAction(title: "예", style: .default, handler: { ACTION in
                // 함수안에 함수라서 (Closure도 함수이므로 self 를 적어 전역변수에 있는 쟤야! 하고 알려줘야 함
                // function에 있는 변수인지, 전역변수에있는 변수인지 모름. - > self 는 viewController
                self.lampImage.image = self.imgOff // viewController
                self.isLampOn = false
            })
            let OffNAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            // 붙여주기
            lampOffAlert.addAction(OffYAction)
            lampOffAlert.addAction(OffNAction)
            
            //화면
            present(lampOffAlert, animated: true, completion: nil)
            
        }else{
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 꺼져있는 상태입니다.", preferredStyle: .alert)
            let OffAction = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: nil)
            
            // 붙여주기
            lampOffAlert.addAction(OffAction)
            // 화면
            present(lampOffAlert, animated: true, completion: nil)
            //animated true와 false 가 다르다. (false는 팍! 뜨는 느낌)
        
        }
    }
    
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        let lampRemoveAlert = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
        let OnAction = UIAlertAction(title: "아니오 켭니다!", style: .default, handler: {ACTION in
            self.lampImage.image = self.imgOn
            self.isLampOn = true
            
            if self.isLampOn{
                self.onErrorMessage()
            }
        })
        let OffAction = UIAlertAction(title: "아니오 끕니다!", style: .default, handler: {ACTION in
            self.lampImage.image = self.imgOff
            self.isLampOn = false
            if self.isLampOn == false{
                self.offErrorMessage()
            }
        })
        let RemoveAction = UIAlertAction(title: "네, 제거합니다!", style: .default, handler: {ACTION in
            self.lampImage.image = self.imgRemove
            self.isLampOn = true
        })

        
        lampRemoveAlert.addAction(OnAction)
        lampRemoveAlert.addAction(OffAction)
        lampRemoveAlert.addAction(RemoveAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
    func onErrorMessage(){
        let ErrorAlert = UIAlertController(title: "경고", message: "현재 램프가 켜져 있습니다.", preferredStyle: .alert)
        let okAciton = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: nil)
        
        ErrorAlert.addAction(okAciton)// 두개 연결
        present(ErrorAlert, animated: true, completion: nil)
    }
    
    func offErrorMessage(){
        let ErrorAlert = UIAlertController(title: "경고", message: "현재 램프가 꺼져 있습니다.", preferredStyle: .alert)
        let okAciton = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: nil)
        
        ErrorAlert.addAction(okAciton)// 두개 연결
        present(ErrorAlert, animated: true, completion: nil)
    }
    
}//ViewController

