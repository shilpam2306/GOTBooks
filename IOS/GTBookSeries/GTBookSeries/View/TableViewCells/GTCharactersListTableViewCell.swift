//
//  GTCharactersListTableViewCell.swift
//  GTBookSeries
//
//  Created by Shilpa M on 10/11/20.
//  Copyright © 2020 Shilpa. All rights reserved.
//

import UIKit

class GTCharactersListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCharacters: UILabel!
    @IBOutlet weak var lblCulture: UILabel!
    @IBOutlet weak var lblBorn: UILabel!
    @IBOutlet weak var lbltitles: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
