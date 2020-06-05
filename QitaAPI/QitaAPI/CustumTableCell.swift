//
//  CustumTableCell.swift
//  QitaAPI
//
//  Created by 山平潤 on 2020/06/04.
//  Copyright © 2020 山平潤. All rights reserved.
//

import UIKit

class CustumTableCell: UITableViewCell {

    @IBOutlet var tit : UILabel!
    @IBOutlet var user : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
