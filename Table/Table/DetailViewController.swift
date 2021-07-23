//
//  DetailViewController.swift
//  Table
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    // prepare 로 넘긴 값을 받는 변수
    var receiveItem = ""
    

    //label 연결
    @IBOutlet weak var lblItem: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 화면에 띄워주기
        lblItem.text = receiveItem
        
    }
    
    //TableViewController가 이 함수를 실행할 것
    // item: 사용자가 클릭한 정보
    func receiveItems(_ item: String){
        receiveItem = item
        
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
