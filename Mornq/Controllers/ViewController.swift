//
//  ViewController.swift
//  Mornq
//
//  Created by Nott Neo on 07/04/20.
//  Copyright © 2020 Diego Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let quoteManager = QuoteManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = quoteManager.randomColor()
    
        let quote = quoteManager.randomQuote()
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
    }


}

