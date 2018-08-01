//
//  Requests.swift
//  travi
//
//  Created by Administrador on 28/04/18.
//

import Foundation
import UIKit
import XLPagerTabStrip
import HexColors
import DateTimePicker

class RequestsController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        Core.shared.setbackground(image: #imageLiteral(resourceName: "FormsBackground"), view: self.view)
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Mapa")
    }
    
    @IBAction func prueba(_ sender: Any) {
        let picker = DateTimePicker.show()
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.isDatePickerOnly = true // to hide time and show only date picker
        picker.completionHandler = { date in
            
            // do something after tapping done
            //yyyy-MM-dd HH:mm:ss +zzzz"
            
            
            print(Core.shared.changeFormat(date: date))
        }
        
    }

    
    
    
    
    
    
}
