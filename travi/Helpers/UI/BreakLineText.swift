//
//  Controller+Coins.swift
//  beerapp
//
//  Created by elaniin on 2/16/18.
//  Copyright © 2018 Elaniin. All rights reserved.
//

import Foundation
import UIKit
import HexColors

extension UIViewController {
    
    func setupCoinsItem() {
        
        
        func setup(coins: String) {
            // Attributes
            let pointsAttributes: [NSAttributedStringKey : Any] = [
                NSAttributedStringKey.foregroundColor: UIColor("#55bfcd"),
                NSAttributedStringKey.font: UIFont(name: "Lato-Medium", size: 10.0)!
            ]
            
            let pointsValueAttributes: [NSAttributedStringKey : Any] = [
                NSAttributedStringKey.foregroundColor: UIColor("#bcc5de"),
                NSAttributedStringKey.font: UIFont(name: "Lato-Medium", size: 17.0)!
            ]
            
            // Strings
            let attrPointsString = NSMutableAttributedString(string: "Monedas \n", attributes: pointsAttributes)
            
            let attrPointsValueString = NSMutableAttributedString(string:  coins, attributes: pointsValueAttributes)
            
            attrPointsString.append(attrPointsValueString)
            
            // Item
            self.navigationController?.navigationBar.backItem?.title = attrPointsString.description
            
        }
        
      
        
        
    }
 
    
    
}

