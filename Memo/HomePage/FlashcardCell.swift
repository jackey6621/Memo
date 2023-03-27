//
//  FlashcardCell.swift
//  Memo
//
//  Created by Leanne A on 3/22/23.
//

import UIKit

class FlashcardCell: UITableViewCell {


    @IBOutlet weak var termDefinitionLabel: UILabel!
    /* Temporary values: Waiting for Parse Config */
    var term = "Hello! Tap to reveal!"
    var defined = "Good job!!!! :D"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func toggleDefinitionLabel() {
        if (termDefinitionLabel.text == term) {
            termDefinitionLabel.text = defined
        }
        else {
            termDefinitionLabel.text = term
        }
        
    }

}
