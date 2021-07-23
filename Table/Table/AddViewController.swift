//
//  AddViewController.swift
//  Table
//
//  Created by HyoEun Kwon on 2021/07/22.
//

import UIKit

class AddViewController: UIViewController {

    
    
    @IBOutlet weak var tfAddItem: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        // 화면에 있는거 가지고 배열에 집어 넣주기
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        
        // pop으로 화면 사라지기
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
