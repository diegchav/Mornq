//
//  ViewController.swift
//  Mornq
//
//  Created by Nott Neo on 07/04/20.
//  Copyright © 2020 Diego Chavez. All rights reserved.
//

import UIKit
import Firebase

extension UIColor {
    public convenience init(hex: String) {
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    let r, g, b: CGFloat
                    let a: CGFloat = 1.00
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff) >> 1) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                    
                }
            }
        }
        
        self.init(red:0.39, green:0.36, blue:0.87, alpha:1.00)
    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let db = Firestore.firestore()
    
    let colorManager = ColorManager()
    
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = colorManager.randomColor()
        
        quoteLabel.text = ""
        authorLabel.text = ""
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
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
                            self.activityIndicator.stopAnimating()
                            self.quoteLabel.text = quote.text
                            self.authorLabel.text = quote.author
                        }
                    }
                }
            }
        }
    }

}

