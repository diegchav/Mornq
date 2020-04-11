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
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                    
                }
            }
        }
        
        self.init(red: (94 / 255), green: (92 / 255), blue: (230 / 255), alpha: 1.00)
    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let db = Firestore.firestore()
    
    var colors: [Color] = []
    var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadColors()
        loadQuotes()
    }
    
    private func loadColors() {
        db.collection(K.Firestore.colorsCollectionName).getDocuments() { (querySnapshot, error) in
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        if let hexColor = data[K.Firestore.colorsHexField] as? String {
                            let color = Color(hex: hexColor)
                            self.colors.append(color)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        if let color = self.colors.randomElement() {
                            self.view.backgroundColor = UIColor(hex: color.hex)
                        }
                    }
                }
            }
        }
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

