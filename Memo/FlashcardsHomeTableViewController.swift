//
//  FlashcardsHomeTableViewController.swift
//  Memo
//
//  Created by Leanne A on 3/22/23.
//

import UIKit

class FlashcardsHomeTableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var decks = [Deck](
        arrayLiteral: Deck(deckTitle: "Spanish Vocabulary", flashcards: [(Flashcard(flashcardTerm: "la cabeza", flashcardDefinition: "head")),
            (Flashcard(flashcardTerm: "la nariz", flashcardDefinition: "nose")),
            (Flashcard(flashcardTerm: "la boca", flashcardDefinition: "mouth")),
            (Flashcard(flashcardTerm: "el ojo", flashcardDefinition: "eye")),
            (Flashcard(flashcardTerm: "la oreja", flashcardDefinition: "ear")),
            (Flashcard(flashcardTerm: "el cuello", flashcardDefinition: "neck")),
            (Flashcard(flashcardTerm: "el codo", flashcardDefinition: "elbow")),
            (Flashcard(flashcardTerm: "la mano", flashcardDefinition: "hand")),
            (Flashcard(flashcardTerm: "el brazo", flashcardDefinition: "arm")),
            ]),
        Deck(deckTitle: "U.S. States and Capitals",
             flashcards: [(Flashcard(flashcardTerm: "Alabama", flashcardDefinition: "Montgomery")),
                          (Flashcard(flashcardTerm: "Alaska", flashcardDefinition: "Juneau")),
                          (Flashcard(flashcardTerm: "Arizona", flashcardDefinition: "Phoenix")),
                          (Flashcard(flashcardTerm: "Arkansas", flashcardDefinition: "Little Rock")),
                          (Flashcard(flashcardTerm: "California", flashcardDefinition: "Sacramento")),
                          (Flashcard(flashcardTerm: "Colorado", flashcardDefinition: "Denver")),
                          (Flashcard(flashcardTerm: "Connecticut", flashcardDefinition: "Hartford")),
                          (Flashcard(flashcardTerm: "Delaware", flashcardDefinition: "Dover")),
                          (Flashcard(flashcardTerm: "Florida", flashcardDefinition: "Tallahassee")),
                          (Flashcard(flashcardTerm: "Georgia", flashcardDefinition: "Atlanta")),
                          (Flashcard(flashcardTerm: "Hawaii", flashcardDefinition: "Honolulu")),
                          (Flashcard(flashcardTerm: "Idaho", flashcardDefinition: "Boise")),
                          (Flashcard(flashcardTerm: "Illinios", flashcardDefinition: "Springfield")),
                          (Flashcard(flashcardTerm: "Indiana", flashcardDefinition: "Indianapolis")),
                          (Flashcard(flashcardTerm: "Iowa", flashcardDefinition: "Des Monies")),
                          (Flashcard(flashcardTerm: "Kansas", flashcardDefinition: "Topeka")),
                          (Flashcard(flashcardTerm: "Kentucky", flashcardDefinition: "Frankfort")),
                          (Flashcard(flashcardTerm: "Louisiana", flashcardDefinition: "Baton Rouge")),
                          (Flashcard(flashcardTerm: "Maine", flashcardDefinition: "Augusta")),
                          (Flashcard(flashcardTerm: "Maryland", flashcardDefinition: "Annapolis")),
                          (Flashcard(flashcardTerm: "Massachusetts", flashcardDefinition: "Boston")),
                          (Flashcard(flashcardTerm: "Michigan", flashcardDefinition: "Lansing")),
                          (Flashcard(flashcardTerm: "Minnesota", flashcardDefinition: "St. Paul")),
                          (Flashcard(flashcardTerm: "Mississippi", flashcardDefinition: "Jackson")),
                          (Flashcard(flashcardTerm: "Missouri", flashcardDefinition: "Jefferson City")),
                          (Flashcard(flashcardTerm: "Montana", flashcardDefinition: "Helena")),
                          (Flashcard(flashcardTerm: "Nebraska", flashcardDefinition: "Lincoln")),
                          (Flashcard(flashcardTerm: "Neveda", flashcardDefinition: "Carson City")),
                          (Flashcard(flashcardTerm: "New Hampshire", flashcardDefinition: "Concord")),
                          (Flashcard(flashcardTerm: "New Jersey", flashcardDefinition: "Trenton")),
                          (Flashcard(flashcardTerm: "New Mexico", flashcardDefinition: "Santa Fe")),
                          (Flashcard(flashcardTerm: "New York", flashcardDefinition: "Albany")),
                          (Flashcard(flashcardTerm: "North Carolina", flashcardDefinition: "Raleigh")),
                          (Flashcard(flashcardTerm: "North Dakota", flashcardDefinition: "Bismarck")),
                          (Flashcard(flashcardTerm: "Ohio", flashcardDefinition: "Columbus")),
                          (Flashcard(flashcardTerm: "Oklahoma", flashcardDefinition: "Oklahoma City")),
                          (Flashcard(flashcardTerm: "Oregon", flashcardDefinition: "Salem")),
                          (Flashcard(flashcardTerm: "Pennsylvania", flashcardDefinition: "Harrisburg")),
                          (Flashcard(flashcardTerm: "Rhoda Island", flashcardDefinition: "Providence")),
                          (Flashcard(flashcardTerm: "South Carolina", flashcardDefinition: "Columbia")),
                          (Flashcard(flashcardTerm: "South Dakoda", flashcardDefinition: "Pierre")),
                          (Flashcard(flashcardTerm: "Tennessee", flashcardDefinition: "Nashville")),
                          (Flashcard(flashcardTerm: "Texas", flashcardDefinition: "Austin")),
                          (Flashcard(flashcardTerm: "Utah", flashcardDefinition: "Salt Lake City")),
                          (Flashcard(flashcardTerm: "Vermont", flashcardDefinition: "Montpelier")),
                          (Flashcard(flashcardTerm: "Virginia", flashcardDefinition: "Richmond")),
                          (Flashcard(flashcardTerm: "Washington", flashcardDefinition: "Olympia")),
                          (Flashcard(flashcardTerm: "West Virginia", flashcardDefinition: "Charleston")),
                          (Flashcard(flashcardTerm: "Wisconsin", flashcardDefinition: "Madison")),
                          (Flashcard(flashcardTerm: "Wyoming", flashcardDefinition: "Cheyenne"))])
    ) {
        
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tableView.reloadData()
        }
    }
    
    var user = User(username: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, " + user.username + "!"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

        
        /*
        do {
            try testDeck.save()
        } catch {
            print("Something went wrong")
        }
         */
        
    }

    private func queryPosts(completion: (() -> Void)? = nil) {
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/2%20-%20Finding%20Objects.xcplaygroundpage/Contents.swift#L66

        
        let query = Deck.query()
            .include("deckTitle")
            .include("flashcards")

            .limit(10) // <- Limit max number of returned posts to 10
        let results = try! query.find()
        print(results)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewDeckSegue",
           let selectedDeckPath = sender as? IndexPath,

           let deckViewController = segue.destination as? DeckTableViewController {
            let selectedDeck = decks[selectedDeckPath.row]
            deckViewController.title = selectedDeck.deckTitle
            deckViewController.flashcards = selectedDeck.flashcards!

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Got clicked")
        performSegue(withIdentifier: "viewDeckSegue", sender: indexPath)
    }


}
extension FlashcardsHomeTableViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeckCell", for: indexPath) as? DeckCell else {
            return UITableViewCell()
        }
        cell.configure(with: decks[indexPath.row])
        return cell
    }
    
    

     
}
