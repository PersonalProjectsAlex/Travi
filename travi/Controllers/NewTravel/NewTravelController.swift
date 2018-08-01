//
//  NewTravelController.swift
//  travi
//
//  Created by Administrador on 3/04/18.
//

import UIKit
import HexColors

class NewTravelController: UIViewController {

    // MARK: - Let-Var
    
    
    // MARK: - Outlets
    
   
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up general actions/delegates/Core
        //setUPActions()
        
        // setting up UI elements to be used throught the code
        setUpUI()
        
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    // MARK: - SetUps / Funcs
    
    
    func setUpUI(){
        
        //NavigationController
        
        Core.shared.generalNavigation(at: self)
        
        
       // Core.shared.setbackground(image: #imageLiteral(resourceName: "FormsBackground"), view: self.view)
        
        //Setting Custom Image on Left Bar Button
        Core.shared.setImageOnLeftBarButton(image: #imageLiteral(resourceName: "LogoText"), at: self)
    }

   

}
