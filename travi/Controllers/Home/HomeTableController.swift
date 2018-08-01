//
//  HomeTableController.swift
//  travi
//
//  Created by Administrador on 29/03/18.
//

import UIKit
import Floaty
import HexColors
import Alamofire
import CodableAlamofire

class HomeTableController: UITableViewController, FloatyDelegate {
    
    // MARK: - Let-Var
    var floatButton = Floaty()
    let refresh = UIRefreshControl()
    
    var array = [String]()
    var home:[Bases]?
    // MARK: - Outlets
    
    @IBOutlet weak var headerView: UIView!
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up general actions/delegates/Core
        setUPActions()
        
        // setting up UI elements to be used through the code
        setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //Calling our Json Data
        gettingData()
        
        print("has been called")
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
        
        //Custom back image
        Core.shared.setCustomBack(image: #imageLiteral(resourceName: "BackButton"), at: self)
        
        //Setting Custom Image on Left Bar Button
        Core.shared.setImageOnLeftBarButton(image: #imageLiteral(resourceName: "LogoText"), at: self)
        
        
    }
    
        func setUPActions(){
            
        //Set Cell Identifier
            Core.shared.registerCell(at: tableView, named: CellIdentifier.cellIdentidentifier)
        
        //Calling Floating Button
        
            //showFloatingButton()
        
        //TableviewDelegates
            tableView.dataSource = self
            tableView.delegate = self
        
        //Refresh Control settings
            refresh.addTarget(self, action: #selector(setupData), for: .valueChanged)
            refresh.attributedTitle = NSAttributedString(string: "Recargando...")
            refresh.tintColor = .lightGray
            tableView.refreshControl = refresh
            
            
    }
    
    //Parsing Data
    private func gettingData(){
        HomeManager().detail {
            base in
            self.refresh.endRefreshing()
            self.home = base
            if let home = self.home{
                if home.count > 0{
                    DispatchQueue.main.async() {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    //setting floatingbutton
    func showFloatingButton() {
        let item = FloatyItem()
        item.hasShadow = true
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.titleLabelPosition = .right
        item.title = "titlePosition right"
        item.handler = { item in}
        floatButton.hasShadow = false
        floatButton.addItem(title: "I got a title")
        floatButton.addItem("I got a handler", icon: #imageLiteral(resourceName: "locationSearch")) {
            item in
            let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        floatButton.addItem(item: item)
        floatButton.sticky = true
        floatButton.fabDelegate = self
        self.view.addSubview(floatButton)
    }

    

    // MARK: - Floaty Delegate Methods
    func floatyWillOpen(_ floaty: Floaty) {
        print("Floaty Will Open")
    }

    func floatyDidOpen(_ floaty: Floaty) {
        print("Floaty Did Open")
    }

    func floatyWillClose(_ floaty: Floaty) {
        print("Floaty Will Close")
    }

    func floatyDidClose(_ floaty: Floaty) {
        print("Floaty Did Close")
    }

    
    // MARK: - Objective C
    @objc func setupData(){
        
        
        guard var home = self.home else{
            print("Home data issue")
            return
        }
        
        home.removeAll()
        gettingData()
        
        
    }
}
