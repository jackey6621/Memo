//
//  DeckCell.swift
//  Memo
//
//  Created by Leanne A on 3/23/23.
//

import UIKit

class DeckCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with deck: Deck) {
        
        if let deckTitle = deck.deckTitle {
            titleLabel.text = deckTitle
        }
        
    }
}
