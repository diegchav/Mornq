//
//  QuoteManager.swift
//  Mornq
//
//  Created by Nott Neo on 07/04/20.
//  Copyright © 2020 Diego Chavez. All rights reserved.
//

import UIKit
import Firebase

struct QuoteManager {
    
    let quotes = [
        Quote(text: "Challenges are what make life interesting and overcoming them is what makes life meaningful.", author: "Joshua J. Marine"),
        Quote(text: "Courage is not having the strength to go on; it is going on when you don't have the strength.", author: "Theodore Roosevelt"),
        Quote(text: "When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.", author: "Henry Ford"),
        Quote(text: "Your imagination is your preview of life’s coming attractions.", author: "Albert Einstein"),
        Quote(text: "Life is what happens to you while you’re busy making other plans.", author: "John Lennon"),
        Quote(text: "Don’t worry about failures; worry about the chances you miss when you don’t even try.", author: "Jack Canfield"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "Limitations live only in our minds. But if we use our imaginations, our possibilities become limitless", author: "Jamie Paolinetti"),
        Quote(text: "There is only one way to avoid criticism: do nothing, say nothing, and be nothing.", author: "Aristotle"),
        Quote(text: "Tough times never last, but tough people do.", author: "Robert Schuller")
    ]
    
    let colors = [
        UIColor.systemIndigo,
        UIColor.systemBlue,
        UIColor.systemGreen,
        UIColor.systemPurple,
        UIColor.systemTeal,
        UIColor.systemOrange,
        UIColor.systemRed,
        UIColor.systemPink
    ]
    
    func randomQuote() -> Quote {
        return quotes.randomElement()!
    }
    
    func randomColor() -> UIColor {
        return colors.randomElement()!
    }
    
}
