//
//  DetailViewController.swift
//  Quiz_CollectionView_Image
//
//  Created by HyoEun Kwon on 2021/07/26.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var detailFlowerImg: UIImageView!
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        detailFlowerImg.image = UIImage(named: receiveItem)
        
    }
    
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
