//
//  ViewController.swift
//  JSONCollectionList
//
//  Created by TJ on 2024/05/07.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var 로딩: UIActivityIndicatorView!
    var ListData: [SavedData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        로딩.isHidden = false
        로딩.startAnimating()
        collectionView.dataSource = self
        collectionView.delegate = self
        var QueryModel = QueryModel()
           QueryModel.delegate = self
           QueryModel.downloadItems()
        
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
        return ListData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        
        let url = URL(string: ListData[indexPath.row].image)
                print(url!)
               DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url!)
                        DispatchQueue.main.async {
                            cell.imageView.image = UIImage(data: data!)
                            
                        }
                    }
        
        return cell
    }
}

// MARK: 인디케이터 & 프로토콜
extension ViewController: QueryModelProtocol{
    func itemDownloaded(items: [SavedData]) {
        ListData = items
        collectionView.reloadData()
        로딩.stopAnimating()
        로딩.isHidden = true
        
    }

}
        

