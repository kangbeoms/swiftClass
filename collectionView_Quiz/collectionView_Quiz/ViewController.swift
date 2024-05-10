//
//  ViewController.swift
//  collectionView_Quiz
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addList()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func addList(){
        dataList.append("f_1.jpg")
        dataList.append("f_2.jpg")
        dataList.append("f_3.jpg")
        dataList.append("f_4.jpg")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoDetail"{
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)

            let detailView = segue.destination as! DetailViewController
            detailView.whatImage = dataList[indexPath!.row]
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
}
// MARK: 컬렉션뷰의 cell 데이터 구성
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = .lightGray
        
        //cell.lblman.text = dataList[indexPath.row]
        //cell.lblman.backgroundColor = .yellow
        cell.myImage.image = UIImage(named: dataList[indexPath.row])
        return cell
    }
    

}
