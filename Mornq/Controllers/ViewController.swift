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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let quote = QuoteModel(text: "Challenges are what make life interesting and overcoming them is what makes life meaningful.",
                               author: "Joshua J. Marine")
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
    }


}

