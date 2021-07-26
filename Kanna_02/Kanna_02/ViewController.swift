//
//  ViewController.swift
//  Kanna_02
//
//  Created by HyoEun Kwon on 2021/07/26.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataCrawling()

    }
    
    func dataCrawling() {
            let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
            guard let main = URL(string: mainUrl) else {
                print("Error : \(mainUrl) doesn't seem to be a valid URL")
                return
            }
            do {
                // //*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
                let htmlData = try String(contentsOf: main, encoding: .utf8)
                let doc = try HTML(html: htmlData, encoding: .utf8)
                
                var count = 1
               // print(doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"))
                for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){ //순위의 제목 _ 뭉치
                    print(count, title.text!.trimmingCharacters(in: .whitespacesAndNewlines)) // 변수에 text를 넣겠다.
                    count += 1
                }
                
            }catch let error{
                print("Error: \(error)")
            }
        }
}

