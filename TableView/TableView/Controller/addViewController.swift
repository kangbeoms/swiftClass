//
//  addViewController.swift
//  TableView
//
//  Created by TJ on 2024/05/02.
//

import UIKit

class addViewController: UIViewController {

    @IBOutlet weak var tfAdd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAct_add(_ sender: UIButton) {
        if tfAdd.text!.isEmpty{
            Message.check = "old"
        }else{
            Message.check = "new"
            Message.item = tfAdd.text!
            Message.itemImage = "google_29.png"
        }
        navigationController?.popViewController(animated: true)
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
