//
//  TableViewCell.swift
//  JSONtableView_Quiz
//
//  Created by TJ on 2024/05/03.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblphone: UILabel!
    
    @IBOutlet weak var imageShow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
