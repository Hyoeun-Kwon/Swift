//
//  ViewController.swift
//  ImageView
//
//  Created by HyoEun Kwon on 2021/07/19.
//

import UIKit

class imageViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    //전역변수 선언때는 코멘트가 무조건 있어야 함!
    
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
    
    var isZoom = false // 이미지 확대 부분
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 화면 뜨기 전
        
        //이미지 파일 준비
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // 이미지 할당
        imgView.image = imgOn
        
        
    }

    
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        // 이미지 크기를 2배로
        //CG : Computer Graphic
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        // 큰그림인지 작은그림인지 컴퓨터가 알 수 있는 변수가 따로 필요 --> 전역변수 isZoom을 만든다.
        
        if isZoom{ // 이미지가 큰지 작은지 isZoom을 통해 알 수 있음
            //true인 경우 : 확대 되어 있는 상태 일 경우
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.width / scale
            btnResize.setTitle("Image 확대", for: .normal)
            
        }else{
            // false인 경우
            
            //현재 크기
            // 현재 그림 가로축 크기 * scale
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.width * scale
            btnResize.setTitle("Image 축소", for: .normal) // 버튼의 글자 변경하기 normal 타입으로
            
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom //isZoom: 상태 변수 *** 꼭 작성
        
    }//btn
    
    // 전구 켜고 끄기
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
        
        
//        // 스위치가 on이냐 off냐는 sender만 알고 있음
//        if sender.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
        
    }//switch
    
    
    

}//ViewController

