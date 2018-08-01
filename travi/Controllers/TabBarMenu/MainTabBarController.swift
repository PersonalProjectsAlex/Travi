//
//  MainTabBarController.swift
//  travi
//
//  Created by Administrador on 31/03/18.//

import Foundation
import UIKit
import Floaty

enum UIUserInterfaceIdiom : Int {
    case unspecified
    
    case phone // iPhone and iPod touch style UI
    case pad // iPad style UI
}

class MainTabBarController: UITabBarController, FloatyDelegate {
    // MARK: - Let-Var
    var floatButton = Floaty()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling Floating Button
        //showFloatingButton()
        
    }
    
    // MARK: - SetUps
    
    // Setting floatingbutton
    func showFloatingButton() {
        let item = FloatyItem()
        item.hasShadow = true
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.titleLabelPosition = .right
        item.title = "titlePosition right"
        item.handler = {item in}
        floatButton.hasShadow = false
        floatButton.addItem(item: item)
        floatButton.size = 1
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            floatButton.paddingY = self.view.frame.width/2 - 110
        case .pad:
            floatButton.paddingY = self.view.frame.width/2 - 281
        case .unspecified:
            break
        case .tv:
            break
        case .carPlay:
            break
        }
        
        floatButton.friendlyTap = true
        floatButton.fabDelegate = self
        self.view.addSubview(floatButton)

        
    }
    
}
