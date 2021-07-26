//
//  AddViewController.swift
//  CollectionView_Label
//
//  Created by HyoEun Kwon on 2021/07/26.
//

import UIKit

class AddViewController: UIViewController {

    
    
    @IBOutlet weak var tfHuman: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnAppendHuman(_ sender: UIButton) {
        
        //textfield 있는 값을 배열에 넣어주기
        list.append(tfHuman.text!)
        navigationController?.popViewController(animated: true)
        
        // pop 으로 지워지기 때문에 굳이 txtfield를 지워줄 필요는 없다.

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
