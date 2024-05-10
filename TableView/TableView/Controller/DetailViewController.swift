//
//  DetailViewController.swift
//  TableView
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblLabel: UILabel!
    
    var recive = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblLabel.text = recive
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
