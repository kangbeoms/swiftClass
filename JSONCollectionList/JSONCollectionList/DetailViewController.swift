//
//  DetailViewController.swift
//  JSONCollectionList
//
//  Created by TJ on 2024/05/07.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var name = ""
    var image = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbltitle.text = name
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
