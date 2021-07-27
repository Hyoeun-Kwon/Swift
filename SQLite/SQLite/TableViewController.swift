//
//  TableViewController.swift
//  SQLite
//
//  Created by HyoEun Kwon on 2021/07/27.
//

import UIKit
import SQLite3 // <<<<<SQLite를 쓰기위해 필요!

class TableViewController: UITableViewController {

    // Outlet : Table View로 연결
    @IBOutlet var tvListView: UITableView!
    
    // Global Variable : 전역변수
    //여기 field 는 메모리에 남게 됨! viewDidLoad는 한번 실행되고 안되지만!(맨처음화면)
    var db: OpaquePointer? // 퍼포먼스 때문에
    var studentsList:[Students] = [] // 0번 배열에 Students.swift 의 4가지가 다 담겨있음 = Bean

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        // SQLite 생성하기 * * * * * * * * * * * * *
        // sqlite는 데이터가 파일네임
        //        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) 이 기본인데 메소드를 추가 가능
        // 나는 파일네임을 StudentsData.sqlite로 할거야!
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentData.sqlite")
        
        //1: filename , 2: opaquepointer : db로 지정해둠
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{ // SQLite_OK 가 아니면

            // SQLite가 열리지 않으면?
            print("error opening database")
        }
        
        //1번쨰: cpointer (아까 db로 잡음)2번째: table 만들기
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS students(sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table : \(errmsg)")
        }
        // * * * * * * * * * * * * * * * * * * * *
        
        // Temporary Insert
        //tempInsert()
        
        // DB내용 불러오기
        readValues()
        
    } // viewDidLoad
    
    // 데이타베이스 새로 불러놓고, 리스트를 새로 구성해야함
    // 테이블리스트 화면 재구성 (numberOfSections, tableView, 2개 (cell 구성 _까지 3개 작동)
    override func viewWillAppear(_ animated: Bool) {
        readValues()
        tvListView.reloadData()
    }

    

    func tempInsert() {
        // Statement
        var stmt: OpaquePointer?
        // 한글 깨짐 방지 (-1 는 2byte의 범위를 잡아주는 것이다)
        // 2byte 일 경우 범위를 -1 로 기호 도 포함이라고 잡아줘야 함
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO students(sname, sdept, sphone) VALUES (?,?,?)"
        
        // != SQLITE_OK 가 아니면 {  } 실행
        // ? 하려고 prepare 사용했었음
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert : \(errmsg)")
            return    // return 할께 없는게 이게 있으면? 그냥 함수를 빠져나가는 것이다! (viewDidLoad 에서는 안하는게 좋음)
        }
        
        // 1번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 1, "효은", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding name : \(errmsg)")
            return
        }
        // 2번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 2, "프랑스어과", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding dept : \(errmsg)")
            return
        }
        // 3번째 VALUES(?) 처리
        if sqlite3_bind_text(stmt, 3, "010-1111-3333", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding phone : \(errmsg)")
            return
        }
        // 실행시키기
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting student : \(errmsg)")
            return
        }
        
        // 오류가 있으면 return 으로 함수 밖으로 나가게 되기때문에 여기까지 오지 못한다.
        // 이게 print 되면 이상이 없다는 의미!
        print("Students saved successfully")
        
    } // tempInsert
    
    // 데이터 불러오기
    func readValues() {
        // Init Array
        // 1. 기존 화면 떠있는 애들을 지워주기  + 새롭게 구성하기
        studentsList.removeAll()
        
        // Query
        let queryString = "SELECT * FROM students"
        
        // Statement
        var stmt: OpaquePointer?
        
        //
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select : \(errmsg)")
            return
        }
        
        // 한줄씩 가져오기
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // Int 값 불러오기
            let id = sqlite3_column_int(stmt, 0)
            // String 값 불러오기
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
            
            // Data 잘 들어갔나 확인
            print(id, name, phone)
            
            // describing:
            studentsList.append(Students(id: Int(id), name: String(describing: name), dept: String(describing: dept), phone: String(describing: phone)))
        }
        // 값이 들어왔으면 table 재구성
        self.tvListView.reloadData()
    }
    
    // MARK: - Table view data source
    // table 세팅!
    // 세션값 몇개 쓰겠다 1 : 1줄  (1줄로 보임)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // 화면에 몇개 나올거다!
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsList.count
    }

    // cell 디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        
        // DB에서 값을 받아오는 것
        // 한번에 사용 : students 에 4개를 한번에 담자!
        let students: Students
        students = studentsList[indexPath.row]
        
        // 이름은 정해져있다. (detailTextLabel)
        cell.textLabel?.text = "학번 : \(students.id)"
        //subtitle
        cell.detailTextLabel?.text = "성명 : \(students.name!)"
        
        return cell // cell 모양이 만들어짐

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            // 이상황이면 indexPath가 몇번째 자리인지 알고 있다.
            
            let detailView = segue.destination as! DetailViewController
            // DetailViewController 에 있는 함수에 값을 넣어준다
            detailView.receiveItems(studentsList[indexPath!.row].id,
                                    studentsList[indexPath!.row].name ?? "",
                                    studentsList[indexPath!.row].dept ?? "",
                                    studentsList[indexPath!.row].phone ?? "")
        }
    } // prepare
    

} // TableViewController
