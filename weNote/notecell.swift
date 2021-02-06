//
//  notecell.swift
//  weNote
//
//  Created by Muhammad Hammam on 06/02/2021.
//

import UIKit

class notecell: UITableViewCell {
    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var notesubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
