//
//  ViewController.swift
//  colection_view
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var List: [String] = []
    // MARK: 화면 시작 전 실행할 내용
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datainit()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
// MARK: 데이터 리스트 채우기
    func datainit(){
        List.append("유비")
        List.append("관우")
        List.append("장비")
        List.append("손권")
        List.append("조조")
        List.append("여포")
        List.append("동탁")
        List.append("손옥")
        List.append("초선")
        List.append("손책")
        List.append("유비")
        List.append("관우")
        List.append("장비")
        List.append("손권")
        List.append("조조")
        List.append("여포")
        List.append("동탁")
        List.append("손옥")
        List.append("초선")
        List.append("손책")
    }
    //MARK: 네비게이션 이동간 prepare 부분
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "sgDetail":
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)

            let detailView = segue.destination as! DetailViewController
            detailView.result = List[indexPath!.row]
        case "GoInsert":
            let controller = segue.destination as! AddViewController
            controller.프로토콜 = self
        default:
            print("Error")
        }
    }
}
    //MARK: protocol 익스텐션 부분
extension ViewController: SaveData{
    func InsertData(_ controller: AddViewController, result: String) {
        List.append(result)
        collectionView.reloadData()
    }
    
}

// MARK: 컬렉션뷰의 cell 사이즈,간격 조정
extension ViewController: UICollectionViewDelegateFlowLayout{
    //위아래 간격 (mini)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // 좌우 간격( mini)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //Cell Size (sizefor)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
}
// MARK: 컬렉션뷰의 cell 데이터 구성
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    //Cell 갯수 (num)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return List.count
    }
    // Cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = .lightGray
        cell.lblman.text = List[indexPath.row]
        cell.lblman.backgroundColor = .yellow
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(List[indexPath.row])
            
    }
    
}
