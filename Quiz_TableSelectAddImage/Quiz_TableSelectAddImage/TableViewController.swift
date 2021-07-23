//
//  TableViewController.swift
//  Quiz_TableSelectAddImage
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

// item 변수 선언
var items = ["책 구매","철수와 약속","스터디 준비하기"]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]



class TableViewController: UITableViewController {

    
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = self.editButtonItem

    }
    
    
    //------>*********** cycle *************
    // 화면이 다시 띄워졌을때 실행되는것 ( 계속 사용 )
    // 화면 뜬 다음에 동작하는 애임 , viewDidLoad는 화면 뜨기 전에 딱 한번만 동작하는 애
    override func viewWillAppear(_ animated: Bool) {
        // 테이블리스트 화면 재구성 (numberOfSections, tableView, 2개 (cell 구성 _까지 3개 작동)
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // -----------
    // Table 셀 삭제 !!
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete")
            items.remove(at: indexPath.row)
            itemsImageFile.remove(at: indexPath.row)
            //-----------data 는 지웠음
            // tableView도 지워줘야함
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // 삭제시 "Delete"를 "삭제"글씨로 바꾸기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    //목록 순서 바꾸기
    // from, to
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //fromIndexPath = 현재위치, to : 이동할 위치
        
        //1. 뭘 이동하겠느냐? (= 해당 위치 알기: 저장해두고, => 삭제하고 , => 삽입)
        // 이동할 item의 위치
        let itemToMove = items[fromIndexPath.row]
        let itemImageToMove = itemsImageFile[fromIndexPath.row] // 얘를 가지고 이동 할 거다!
        
        //2. - 집 비워두기
        // 이동할 item을 삭제
        items.remove(at: fromIndexPath.row)
        itemsImageFile.remove(at: fromIndexPath.row)
        
        //3.- 이사
        //해당 위치로 삽입
        items.insert(itemToMove, at: to.row)
        itemsImageFile.insert(itemImageToMove, at: to.row)
        
        // 이동은 배열의 insert
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //Detail View
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            // -> 몇번째 클릭한거야
           // print(type(of: indexPath))
            
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItems(items[indexPath!.row], itemsImageFile[indexPath!.row])

        }
        
   
    }//prepare
    

}
