//
//  ViewController.swift
//  Snackbar
//
//  Created by TJ on 2024/05/09.
//

import UIKit
import SnackBar_swift

class ViewController: UIViewController {

    @IBOutlet weak var lblstate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLong(_ sender: UIButton) {
        AppSnackBar.make(in: self.view, message: "SnackBar popUp Long",
                         duration: .lengthLong)
        .setAction(with: "OK", action: {
            self.lblstate.text = "Long time Snack Bar"
        })
            .show()
    }
    
    @IBAction func btnShort(_ sender: UIButton) {
        AppSnackBar.make(in: self.view, message: "SnackBar popUp Short",
                         duration: .lengthShort)
        .setAction(with: "OK", action: {
            self.lblstate.text = "Short time Snack Bar"
        })
            .show()
    }
}

class AppSnackBar: SnackBar {
    
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .brown
        style.textColor = .black
        style.actionTextColor = .black
        return style
    }
}
