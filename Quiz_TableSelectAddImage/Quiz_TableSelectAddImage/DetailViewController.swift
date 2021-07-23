//
//  DetailViewController.swift
//  Quiz_TableSelectAddImage
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var detailImgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var receiveItem = ""
    var receiveItemImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = receiveItem
        detailImgView.image = UIImage(named: receiveItemImage)
        
    }
    
    
    func receiveItems(_ item: String, _ itemImage: String){
        receiveItem = item
        receiveItemImage = itemImage
  
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
