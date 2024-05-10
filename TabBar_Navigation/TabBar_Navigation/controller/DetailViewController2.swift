//
//  DetailViewController.swift
//  TableView_Quiz
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class DetailViewController2: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblwhatText: UILabel!
    
    var text = ""
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblwhatText.text = text
        imageView.image = UIImage(named: image)
        // Do any additional setup after loading the view.
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
