//
//  Deck.swift
//  Memo
//
//  Created by Leanne A on 3/23/23.
//

import Foundation
import ParseSwift

struct Deck: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var deckTitle:String?
    var flashcards:[Flashcard]?

}
