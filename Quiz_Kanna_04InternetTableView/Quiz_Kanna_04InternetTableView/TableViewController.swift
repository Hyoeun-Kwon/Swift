//
//  TableViewController.swift
//  Quiz_Kanna_04InternetTableView
//
//  Created by HyoEun Kwon on 2021/07/26.
//

import UIKit
import Kanna //<<<<<

class TableViewController: UITableViewController {
    
    var list: [String] = []
    var urlList: [String] = []
    
    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCrawling()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //------>*********** cycle *************
    // 화면이 다시 띄워졌을때 실행되는것 ( 계속 사용 )
    // 화면 뜬 다음에 동작하는 애임 , viewDidLoad는 화면 뜨기 전에 딱 한번만 동작하는 애
    override func viewWillAppear(_ animated: Bool) {
        // 테이블리스트 화면 재구성 (numberOfSections, tableView, 2개 (cell 구성 _까지 3개 작동)
        tvListView.reloadData()
    }

    //
    func dataCrawling() {
            let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
            guard let main = URL(string: mainUrl) else { print("Error : \(mainUrl) doesn't seem to be a valid URL")
                return
            }
            do {
                // //*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
                let htmlData = try String(contentsOf: main, encoding: .utf8)
                let doc = try HTML(html: htmlData, encoding: .utf8)
                
                var count = 1
                for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                    //print(count, title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                    print(count, title["href"]!)
                    list.append("\(count). \t \(title.text!.trimmingCharacters(in: .whitespacesAndNewlines))")
                    urlList.append("https://www.rottentomatoes.com\(title["href"]!.trimmingCharacters(in: .whitespacesAndNewlines))")
        
                    count += 1
                }
                print(urlList)
                
            }catch let error{
                print("Error: \(error)")
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgWebSite"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let webSiteView = segue.destination as! HomePageViewController
            
            webSiteView.receiveItems(urlList[indexPath!.row])        }
    }
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        
        cell.textLabel?.text = list[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
