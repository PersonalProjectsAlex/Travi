//
//  FillSuitcaseTableController.swift
//  travi
//
//  Created by Administrador on 19/04/18.
//


import UIKit
import HexColors

class FillSuitcaseTableController: UITableViewController {

    // MARK: - Let-Var
    
    var array = [String]()
    // MARK: - Outlets
    
    @IBOutlet weak var headerView: UIView!
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up general actions/delegates/Core
        setUPActions()
        
        // setting up UI elements to be used throught the code
        setUpUI()
        
    }
    
    
    
    // MARK: - Navigation
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == Segues.HomeToProductsDetails{
            let detailController = segue.destination as! ProductsDetailController
            detailController.array = array
            
        }
    }
    
    
    // MARK: - SetUps / Funcs
    
    
    func setUpUI(){
        
        //NavigationController
        
        Core.shared.generalNavigation(at: self)
        
        
    }
    
   
    
    func setUPActions(){
        
        //Set Cell Identifier
        Core.shared.registerCell(at: tableView, named: CellIdentifier.cellIdentidentifier)
        
        //Calling Floating Button
        
        //TableviewDelegates
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
  
    
    
}

