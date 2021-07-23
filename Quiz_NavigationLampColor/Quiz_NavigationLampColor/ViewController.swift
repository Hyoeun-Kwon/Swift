//
//  ViewController.swift
//  Quiz_NavigationLampColor
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    
    //image 만들어주기
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRed = UIImage(named: "lamp_pink.png")
    
    
    //On,Off 상태변수 ---> 처음엔 이 상태값이 들어감
    var isOn = true
    //red 상태변수
    var isRed = false
    
    override func viewDidLoad() { // OnCreate
        super.viewDidLoad()
        //초기 화면 : lamp On
        imgView.image = imgOn
    }//
    
    // Seg 대한 정보
    // ViewController와 SelectViewController의 값을 일치 시켜 준다.(복붙) - prepare를 통해
    // Main통해 넘어온 값은 SelectViewController(destination)에서 알아서 한다.
    // targer에게 '넌 이거야!, 이걸로 알아서 해' // 내가 이걸 준비했어, 이거 가져가 ------ OnResume
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectViewController = segue.destination as! SelectViewController
        
        // 권한주기 ( ViewController에서 쓸 수 있어)
         selectViewController.delegate = self  // 번역기야 말해바! 여기에 말할수 있는 기회를 줄게 우리가 다 들어줄게
        //extension을 쓴다고..? _ 출입증 필요해
        
        // ViewController의 전구 상태 보내기
        selectViewController.isOn = isOn // On,Off 상태
        selectViewController.isRed = isRed // Red 상태
        
    }//prepare


}//ViewController

extension ViewController: SelectDelegate{
    // 출입증 받아왔니?? --> 받아왔대 -> 오 그러면 해줄게 
    // 번역기에 담은걸 extension이 '내가 번역기의 기능을 빌려서 해줄게'------ 번역!
    // 전구 image
    func didImageOnOffDone(_ controller: SelectViewController, isOn: Bool, isRed: Bool) {
        // isOn 과 isRed Argument에 담겨있는 것은 SelectViewController에서 '확인' 버튼을 통해 다 넘겨줌 (이미 담겨있음)
        // 나(ViewController)랑 값을 일치를 시킨다!(최신화) _>
        if isOn{
            self.isOn = isOn
            if isRed {
                imgView.image = imgRed
                self.isRed = true
            }else{
                imgView.image = imgOn
                self.isRed = false
            }
        }else {
            self.isOn = isOn
            imgView.image = imgOff
        }
    }//
    
}//-------
