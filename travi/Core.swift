// Core.swift
// travi
//
// Created by Administrador on 29/03/18.
//
//
import Foundation
import UIKit
import HexColors

class Core {
    static let shared = Core()
    private init() {}
    
    
    //MARK: - UI
    
    //Show Alert Message (function)
     func alert(message: String, title: String, at viewController: UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    // Setting custom image onBack Uitabbar
    func setCustomBack(image:UIImage, at: UIViewController){
        var set = image
        set = set.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        if let navigation = at.navigationController?.navigationBar {
        navigation.backIndicatorImage = set
        at.navigationController!.navigationBar.backIndicatorTransitionMaskImage = set
        }
    }
    
    //Custom image on BarButton
    func setImageOnLeftBarButton(image: UIImage, at: UIViewController){
        let imageView = UIImageView(image:image)
        let item = UIBarButtonItem(customView: imageView)
        at.navigationItem.leftBarButtonItem = item
    }
    
    //Function to call a general navigation bar on our screens
    func generalNavigation(at: UIViewController) {
        if let navigationController = at.navigationController?.navigationBar {
            navigationController.barTintColor = HexColor(Colors.mainColor)
            navigationController.isTranslucent = false
            navigationController.setValue(true, forKey: "hidesShadow")
        }
    }
    
    //Change DateFormat
    func changeFormat(date:Date) -> String{
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        let showDate = inputFormatter.date(from: date.description)
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let resultString = inputFormatter.string(from: showDate!)
        return resultString
    }
    
    //Imagebackground
    func setbackground(image: UIImage, view: UIView){
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.bottomRight
        imageView.clipsToBounds = true
        imageView.image = image
        
        view.addSubview(imageView)
        view.sendSubview(toBack: imageView)
    }
    
    
    // MARK. -Helpers
    
    func setStoryBoardName(storyboard: String, controller: String, at: UIViewController) -> UIViewController{
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: controller)
        
    }
    
    
        
    // MARK. -Components
    
    
    
    // Register cell at a table view
    func registerCell(at tableView: UITableView, named: String, withIdentifier: String? = nil) {
        let cellNib = UINib(nibName: named, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: withIdentifier ?? named)
    }
    
    // Register cell at a table view
    func registerCellCollection(at collectionView: UICollectionView, named: String, withIdentifier: String? = nil) {
        let cellNib = UINib(nibName: named, bundle: nil)
        
        collectionView.register(cellNib, forCellWithReuseIdentifier: withIdentifier ?? named)
    }
    
}



