//
//  Flashcard.swift
//  Memo
//
//  Created by Leanne A on 3/23/23.
//

import Foundation
import ParseSwift

struct Flashcard: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var flashcardTerm:String?
    var flashcardDefinition:String?
}
