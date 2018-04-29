//
//  TableViewCell.swift
//  Login
//
//  Created by PUNEET TOKHI on 4/25/18.
//  Copyright © 2018 CMPE 137. All rights reserved.
//

import UIKit

// swift file for the TableViewCell.xib
class TableViewCell: UITableViewCell {
    
    // IBOutlet variables used by the xib file as labels
    @IBOutlet var website: UILabel!
    @IBOutlet var postedBy: UILabel!
    
    @IBOutlet var dateAndTime: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var organizerName: UILabel!
    @IBOutlet var partyName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

