//
//  ViewController.swift
//  Mornq
//
//  Created by Nott Neo on 07/04/20.
//  Copyright © 2020 Diego Chavez. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let db = Firestore.firestore()
    
    let quoteManager = QuoteManager()
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = quoteManager.randomColor()
        
        loadQuotes()
    }
    
    private func loadQuotes() {
        db.collection(K.Firestore.quotesCollectionName).getDocuments() { (querySnapshot, error) in
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        if let quoteText = data[K.Firestore.quotesTextField] as? String, let quoteAuthor = data[K.Firestore.quotesAuthorField] as? String {
                            let quote = Quote(text: quoteText, author: quoteAuthor)
                            self.quotes.append(quote)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        if let quote = self.quotes.randomElement() {
                            self.quoteLabel.text = quote.text
                            self.authorLabel.text = quote.author
                        }
                    }
                }
            }
        }
    }

}

