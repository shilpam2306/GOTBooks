//
//  GTBooksSeriesTableViewCell.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

class GTBooksSeriesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblBooksName: UILabel!
    @IBOutlet weak var lblBooksId: UILabel!
    
    var books : GTBooksData? {
        didSet {
            lblBooksId.text = books?.url
            //lblBooksName.text = books?.employeeName
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
