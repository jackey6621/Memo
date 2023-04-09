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
        arrayLiteral: Deck(deckTitle: "spanish", flashcards: []),
        Deck(deckTitle: "capital",
             flashcards: []),
        Deck(deckTitle:"Latin Roots", flashcards:[]),
        Deck(deckTitle:"Physics - Thermodynamics", flashcards: []),
        Deck(deckTitle: "German Vocabulary", flashcards: [])
    ) {
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tableView.reloadData()
        }
    }
    
    private var flashcard = [Flashcard]() {
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
        
        
        
        for i in  0...(decks.count - 1) {
            decks[i].flashcards = []
        }
         
        
        /*
        do {
            try testDeck.save()
        } catch {
            print("Something went wrong")
        }
         */
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        queryPosts()
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        

    }

//    private func queryPosts(completion: (() -> Void)? = nil) {
//        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/2%20-%20Finding%20Objects.xcplaygroundpage/Contents.swift#L66
//
//
//        let query = Deck.query()
//            .include("deckTitle")
//            .include("flashcards")
//
//            .limit(10) // <- Limit max number of returned posts to 10
//        let results = try! query.find()
//        print(results)
//
//    }
    
    private func queryPosts(completion: (() -> Void)? = nil) {
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/2%20-%20Finding%20Objects.xcplaygroundpage/Contents.swift#L66

        
        let query = Flashcard.query()
            .include("flashcardTerm")

        query.find { [weak self] result in
            switch result {
            case .success(let flashcard):
                // Update local posts property with fetched posts
                self?.flashcard = flashcard
                
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
        for i in 0...(decks.count - 1) {
            if decks[i].flashcards != [] {
                continue
            }
            for card in flashcard {
                if (card.deck == decks[i].deckTitle) {
                    decks[i].flashcards?.append(card)
                }
            }
        }
        
    }
     
    private func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Please try again...")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewDeckSegue",
           let selectedDeckPath = sender as? IndexPath,
           
           let deckViewController = segue.destination as? DeckTableViewController {
            queryPosts()
            var selectedDeck = decks[selectedDeckPath.row]
            deckViewController.title = selectedDeck.deckTitle
            //deckViewController.flashcards = selectedDeck.flashcards!
            /*/
            for card in flashcard {
                if (card.deck == selectedDeck.deckTitle) {
                    selectedDeck.flashcards?.append(card)
                }
            }
             */
            deckViewController.flashcards = selectedDeck.flashcards!
            

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
