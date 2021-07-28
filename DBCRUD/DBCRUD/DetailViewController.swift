//
//  DetailViewController.swift
//  DBCRUD
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import UIKit

class DetailViewController: UIViewController {

    var receive:DBModel = DBModel()
    
    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
//    var receiveItem = DBModel.init(scode: "", sname: "", sdept: "", sphone: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfCode.text = receive.scode
        tfName.text = receive.sname
        tfDept.text = receive.sdept
        tfPhone.text = receive.sphone

    }

    
    // prepare 값 받기
    func receiveItems(_ student: DBModel) {
        receive = student

    } // receiveItems


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func btnModify(_ sender: UIButton) {
        
        
        // 값을 받아와서 써야함
        // 바뀌면 안됨
        let code = tfCode.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        
        // QueryModel 처럼 InsertModel을 만들어야 함 : swift.file
        
        let modifyModel = ModifyModel()
        let result = modifyModel.modifyItems(code: code!, name: name!, dept: dept!, phone: phone!)
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "수정되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: { ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
       
        }else{
            let resultAlert = UIAlertController(title: "에러", message: "에러가 발생했습니다..", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: { ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)

        }
        

    }//btnModify
    
    
    
    
    
    
    @IBAction func btnDelete(_ sender: UIButton) {
        
        // 값을 받아와서 써야함
        // 바뀌면 안됨
        let code = tfCode.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        
        // QueryModel 처럼 InsertModel을 만들어야 함 : swift.file
        
        let deleteModel = DeleteModel()
        let result = deleteModel.deleteItems(code: code!)
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "삭제되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: { ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
       
        }else{
            let resultAlert = UIAlertController(title: "에러", message: "에러가 발생했습니다..", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: { ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)

        }
        
    }//btnDelete
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//-------
