//
//  ViewController.swift
//  PickerView
//
//  Created by HyoEun Kwon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {
    //pickerView에 extension 쓰는 거 잊지 말자 
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    
    // 그림도 배열로 만들어 둠 -> 그래야 피커뷰 움직임에 따라 바로바로 나옴 ( 움직일때마다 파일 부르기..? NO : 해상도가 큼!) 즉, 안만들어도 되지만 해두면 좋다
    var imageArray = [UIImage?]() // 기본적으로 UI 쓰는건 Optional 임
    //column을 1개만 만들겠다.
    var maxArrayNum = 0 //data 몇개 만들겠다. (전체 이미지 갯수)
    let viewColumn = 1
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        maxArrayNum = imageFileName.count
        
        for i in 0..<maxArrayNum{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image) // image가 들어간 어레이 만듬
        }
        
        lblImageFileName.text = "Select File :\(imageFileName[0])"
        imgView.image = imageArray[0]
        
        
        //viewDidLoad 에서 extension 연결
        pickerImage.dataSource = self
        //2번째 확장 연결
        pickerImage.delegate = self
        
        
    }//viewDidLoad

    //pickerView는 기본적으로 Action이 없고 Outlet만 있음 -> extension 필요 ( + delegation)
    
  
}//ViewController

//pickerView는 2가지 기능
extension ViewController: UIPickerViewDataSource{
    
    // pickerView의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn //Int 값임
    }
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
} // 외형 담당 : DataSource

// 데이터 넣기(이름구성), 액션
extension ViewController: UIPickerViewDelegate{
    // PickerView에 Title 입히기
    //titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row] // 배열로 잡은것, for문을 안돌려도 알아서 구성 해옴
    }
    
    
    // pickerView에 Image 선택 했을 경우
    //didSelectRow
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imgView.image = imageArray[row]
    }

    
}
