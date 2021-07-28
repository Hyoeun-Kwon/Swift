//
//  TableViewController.swift
//  ServerJson_02
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    // 앱 종료하지 않고 다른거 봤을때 없어지는것 : weak
    // 앱을 종료해야 없어지는 것: strong
    @IBOutlet var listTableView: UITableView!
    
    //Global Protocol
    var feedItem: NSArray = NSArray() //NSArray는 Int, String 다 가능하므로!, 배열의 제일 큰 애 _ NS : Next Step
    //뮤터블가능
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Instance (Object Instance 객체)
        let jsonModel = JsonModel() //protocol 과 class 가 들어가있음,
        
        jsonModel.delegate = self // self 가 있으면? extension 이 있다.
        jsonModel.downloadItems() // JsonModel의 downloadItems 함수 실행 __// items 만듬 (어떻게 만드는지는 JsonModel 가보기!)
        //extension --> 부터해주자
        
        
        // Cell의 크기를 정한다.
        listTableView.rowHeight = 124
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell //default가 아닌 나만의 커스텀을 위해서는 as! TableViewCell 잊지말기 *****
        // Configure the cell...
        
        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel //feedItem의 몇번째를 DBModel로 타입을 변경
        // 현재 feedItem 은 0번 1번 각 두줄! (각 줄에는 scode, sname, sdept, sphone) 으로 4개가 들어가 있음
        // DBModel 로 변경해야 .sname 이런식으로 불러서 사용 가능해짐!
        //item값이 들어가있음
        
        cell.lblCode.text = "학번 : \(item.scode!)" // cell 안에있는 00라벨에다가 넣어줘!
        cell.lblName.text = "성명 : \(item.sname!)"
        cell.lblDept.text = "전공 : \(item.sdept!)"
        cell.lblPhone.text = "전화 : \(item.sphone!)"
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

extension TableViewController: JsonModelProtocol{
    func itemDownloaded(items: NSArray) { //NSArray(배열 중 제일큰것) : 타입 꼭 지정안해도 ok..!? -> String과 Int 같이 쓸 수 있음
        feedItem = items //가져온 data 가 들어올거임!
        self.listTableView.reloadData()//화면에 찍는다 (Table 세션 몇개다, 디자인 어떻다)
        // 데이터가 새로 들어왔으니 table을 다시 구성해줘
    }
}

