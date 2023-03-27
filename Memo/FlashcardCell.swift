//
//  FlashcardCell.swift
//  Memo
//
//  Created by Leanne A on 3/22/23.
//

import UIKit

class FlashcardCell: UITableViewCell {


    @IBOutlet weak var termDefinitionLabel: UILabel!
    var term = "Placeholder Text for Term"
    var defined = "Placeholder Text for Definition"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func toggleDefinitionLabel() {
        if (termDefinitionLabel.text == term) {
            termDefinitionLabel.text = defined
        }
        else {
            termDefinitionLabel.text = term
        }
        
    }
    
    func configure(with flashcard: Flashcard) {
        term = flashcard.flashcardTerm!
        defined = flashcard.flashcardDefinition!

        termDefinitionLabel.text = term
        
    }

}
