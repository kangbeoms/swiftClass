//
//  DetailViewController.swift
//  Table_control_Quiz
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblresult: UILabel!
    
    var result = ""
    var image = ""
    var whatKind = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: image)
        lblresult.text = "이 \(result == "벌" ? "곤충" : "동물")의 이름은 \(result) 이며 분류는 \(whatKind) 이며 \(result == "벌" ? "날수 있습니다" : "날수 없습니다.")"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
