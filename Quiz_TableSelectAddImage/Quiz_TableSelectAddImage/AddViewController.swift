//
//  AddViewController.swift
//  Quiz_TableSelectAddImage
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var addImgView: UIImageView! 
    @IBOutlet weak var addPickerView: UIPickerView!
    @IBOutlet weak var tfInputTitle: UITextField!
    
    
    
    //pickerView 설정
    var imgArray = [UIImage?]()
    var maxArrayNum = 0
    let viewColumn = 1
    
    // imageView
 //   var imgList = ["cart.png","clock.png","pencil.png"]
    var imgIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maxArrayNum = itemsImageFile.count
        
        //image 먼저 넣어두기
        for i in 0..<maxArrayNum{
            let image = UIImage(named: itemsImageFile[i])
            imgArray.append(image)
        }
        
        
        // 초기화면 : 해당 리스트의 그림 띄우기
        addImgView.image = imgArray[imgIndex]
        
        // extension 연결
        addPickerView.dataSource = self
        addPickerView.delegate = self
        
        
    }//viewDidLoad
    
    
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        // 값을 배열에 넣어주기, 창닫기
        items.append(tfInputTitle.text!)
        itemsImageFile.append(itemsImageFile[imgIndex])
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
}

extension AddViewController: UIPickerViewDelegate{
  
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
                let addImageView = UIImageView(image: imgArray[row])
                addImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // 이미지 뷰의 프레임 크기 설정
                return addImageView
            }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //현재 선택된 이미지를 prepare로 보내줘
        addImgView.image = imgArray[row]
        imgIndex = row
    }
}
