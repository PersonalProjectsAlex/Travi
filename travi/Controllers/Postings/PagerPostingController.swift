//
//  PagerPostingController.swift
//  travi
//
//  Created by Administrador on 28/04/18.
//


import UIKit
import XLPagerTabStrip
import HexColors

class PagerPostingController: ButtonBarPagerTabStripViewController {
    // MARK: - Let-Var
    
    // MARK: - Outlets
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up UI elements to be used throught the code
        setUpUI()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    
    
    // MARK: - SetUps / Funcs
    
    func setUpUI(){
        
        //Calling Pager
        setUpPager()
        
        Core.shared.setbackground(image: #imageLiteral(resourceName: "FormsBackground"), view: self.view)
    }
    
    //Setting pages
    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = Core.shared.setStoryBoardName(storyboard: "Posting", controller: "Request", at: self)
        let child_2 = Core.shared.setStoryBoardName(storyboard: "Posting", controller: Constants.entrust, at: self)
        
        return [child_1,child_2]
    }
    
    //Setting Pager
    func setUpPager(){
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .gray
        buttonBarView.selectedBar.backgroundColor = HexColor(Colors.mainColor)
        buttonBarView.backgroundColor = .white
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        settings.style.buttonBarItemLeftRightMargin = 0
        settings.style.buttonBarItemLeftRightMargin = 0
    }
    
    
}





