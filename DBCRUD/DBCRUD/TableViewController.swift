//
//  TableViewController.swift
//  DBCRUD
//
//  Created by HyoEun Kwon on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    
    //테이블뷰의 역할 : jsp 를 실행시키고 json 가져옴!?
    @IBOutlet var listTableView: UITableView!
   // var feedItem: NSArray = NSArray()
    var feedItem: NSMutableArray = NSMutableArray()
    
    //스와이프
    //var numOfTouches = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 한손가락 Gesture 구성
       // makeSingleTouch()
        
//        // pageControl 설정
//        pageControl.numberOfPages = webSiteNames.count
//        pageControl.currentPage = 0
//        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    override func viewWillAppear(_ animated: Bool) {
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel //feedItem의 몇번째를 DBModel로 타입을 변경
        // 현재 feedItem 은 0번 1번 각 두줄! (각 줄에는 scode, sname, sdept, sphone) 으로 4개가 들어가 있음
        // DBModel 로 변경해야 .sname 이런식으로 불러서 사용 가능해짐!
        //item값이 들어가있음
        
        cell.textLabel?.text = "성명 : \(item.sname!)"
        cell.detailTextLabel?.text = "학번 : \(item.scode!)"
       

        return cell
    }
    
    
//    func makeSingleTouch(){
//
//        //left
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(TableViewController.respondToSwipeGesture(_:)))
//        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left // direction이 left이다 지정
//        self.view.addGestureRecognizer(swipeLeft)
//
//        //right
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(TableViewController.respondToSwipeGesture(_:)))
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right // direction이 right이다 지정
//        self.view.addGestureRecognizer(swipeRight)
//    }
    
    
//    //up인지 down인지 받아야 함
//    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
//            //초기 값 주고 원하는 것만 색상 변경 할 거임 ----> 하나만 빨간색으로 보이게 하려고
//
//            //제스쳐 방향
//            switch swipeGesture.direction{
//
//            // 여기에 행동 지정
//            case UISwipeGestureRecognizer.Direction.left:
//
//
//
//            case UISwipeGestureRecognizer.Direction.right:
//
//
//
//
//            default:
//                break
//            }
//        }
//    }
    
    

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
 
            // QueryModel 처럼 InsertModel을 만들어야 함 : swift.file
            let item: DBModel = feedItem[indexPath.row] as! DBModel
            
            let deleteModel = DeleteModel()
            let result = deleteModel.deleteItems(code: item.scode! )
            
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
   

            print("Delete")
            feedItem.removeObject(at: indexPath.row)
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

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
            // 이상황이면 indexPath가 몇번째 자리인지 알고 있다.

            let detailView = segue.destination as! DetailViewController
            let item: DBModel = feedItem[indexPath!.row] as! DBModel
            // DetailViewController 에 있는 함수에 값을 넣어준다
            detailView.receiveItems(item)

         }
    }

}//-----

extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: NSArray) { //NSArray(배열 중 제일큰것) : 타입 꼭 지정안해도 ok..!? -> String과 Int 같이 쓸 수 있음
        feedItem = items as! NSMutableArray //가져온 data 가 들어올거임!
        self.listTableView.reloadData()//화면에 찍는다 (Table 세션 몇개다, 디자인 어떻다)
        // 데이터가 새로 들어왔으니 table을 다시 구성해줘
    }
}

