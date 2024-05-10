//
//  ViewController.swift
//  CollectionView_Multi_Quiz
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var ListData: [String] = []
    var Listimage: [String] = []
    var ListKind: [String] = []
    var name = ""
    var whatkind = ""
    var image = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AddList()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func AddList(){
    
        ListData.append("벌")
        ListData.append("고양이")
        ListData.append("소")
        ListData.append("개")
        ListData.append("여우")
        ListData.append("원숭이")
        ListData.append("돼지")
        ListData.append("늑대")
        
        Listimage.append("bee.png")
        Listimage.append("cat.png")
        Listimage.append("cow.png")
        Listimage.append("dog.png")
        Listimage.append("fox.png")
        Listimage.append("monkey.png")
        Listimage.append("pig.png")
        Listimage.append("wolf.png")
        
        ListKind.append("곤충")
        ListKind.append("포유류")
        ListKind.append("포유류")
        ListKind.append("포유류")
        ListKind.append("포유류")
        ListKind.append("영장류")
        ListKind.append("포유류")
        ListKind.append("포유류")
       
      }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoDetail"{
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)

            let detailView = segue.destination as! DetailViewController
               
            detailView.result  =  SaveData(name: name, image: image, Kind: whatkind)
          image =   Listimage[indexPath!.row]
          name  =  ListData[indexPath!.row]
           whatkind =  ListKind[indexPath!.row]
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
        let width = collectionView.frame.width / 2 - 1
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
        
        cell.lblName.text = ListData[indexPath.row]
        cell.imageView.image = UIImage(named: Listimage[indexPath.row])
        
        return cell
    }
}
