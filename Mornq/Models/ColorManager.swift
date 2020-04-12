//
//  QuoteManager].swift
//  Mornq
//
//  Created by Nott Neo on 12/04/20.
//  Copyright © 2020 Diego Chavez. All rights reserved.
//

import UIKit

struct ColorManager {
    
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
    
    func randomColor() -> UIColor {
        return colors.randomElement()!
    }
    
}
