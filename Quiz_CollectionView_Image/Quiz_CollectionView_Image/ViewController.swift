//
//  ViewController.swift
//  Quiz_CollectionView_Image
//
//  Created by HyoEun Kwon on 2021/07/26.
//

import UIKit

var flowerImgName = ["flower_01","flower_02","flower_03","flower_04","flower_05","flower_06"]

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }//viewDidLoad
    

    // 라이프 사이클!! AddView에 추가한 데이터가 안보여!? (pop하고 사라진 뒤 )
    // ViewController는 그 값을 모르므로 viewDidLoad 말고 계속 아는 (반복사용되는 ) 것이 필요함
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()  // cell 전체를 다시 다 로드!
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgDetail"{
            let cell = sender as! CollectionViewCell
            let indexPath = self.collectionView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItems(flowerImgName[indexPath!.row])
        }
        
    }
    
    
    
    
    
    

}//ViewController

//extension 을 ViewController에 주겠다.
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // cell의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flowerImgName.count
    }
    
    // cell 구성
    // cell 을 정의하는거 -> 리사이클러뷰와 비슷한 것
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 리유저블! --> table view보다 메모리 효율 좋음
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        //as! CollectionViewCell 타입으로 변환!
        //cell.backgroundColor = .lightGray //cell 배경색
        cell.imgFlower.image = UIImage(named: flowerImgName[indexPath.row])
        //cell.imgFlower.backgroundColor = .yellow //글자의 배경색
        return cell //받는게 UICollectionViewCell 이므로
    }
    
}//extension

// Cell Layout 정의
// View Controller에게 알려줘야함 뷰 컨트롤러는 컬렉션 뷰에대해 모름
extension ViewController: UICollectionViewDelegateFlowLayout{ // 화면은 정해져있는데, 배치 어떻게 할래?
    //배치에대한 부분
    
    // 위 아래 간격
    // minimumLineSpacingForSectionAt   -- line
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 //UI 간격을 하나씩 띄울거야! (line 위, 아래)
    }
    
    // 옆 간격
    // minimumInteritemSapcingForSectionAt -- inter
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell 사이즈 ( 옆 라인을 고려하여 설정) : 왼, 오른쪽에 다른 셀이 붙을것이므로
    // sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 한줄을 3등분 하여 배치, 옆 간격이 1이므로 1을 빼줌
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width) // 정사각형 만들기 위함
        return size
    }
    
}


