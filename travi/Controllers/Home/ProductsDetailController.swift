//
//  ProductsDetailController.swift
//  travi
//
//  Created by Administrador on 1/04/18.
//

import UIKit
import HexColors
import ImageSlideshow

class ProductsDetailController: UIViewController {
    
    // MARK: - Let-Var
    var images = [ImageSource]()
    var array = [String]()
    
    // MARK: - Outlets
    @IBOutlet var slideshow: ImageSlideshow!
    @IBOutlet weak var maskingUIView: UIView!
    
    
    // MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up UI elements to be used through the code
        setUpUI()
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

    // MARK: - SetUps
    
    
    /**
     *Setting up UI elements to be used through the code*
     - important: This Set Up will just be called to make some UI Changes

     */
    
    func setUpUI(){

        //Slide Image: UI
        setSlider()
        
    }
    
    // MARK: - Funcs
    
    //Setting SlideImage
    
    func setSlider(){
        slideshow.addSubview(maskingUIView)
        
        slideshow.backgroundColor = UIColor.white
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        images = [
            ImageSource(imageString: "laptop")!,
            ImageSource(imageString: "laptop")!,
            ImageSource(imageString: "laptop")!,
            ImageSource(imageString: "laptop")!]
        slideshow.setImageInputs(images)
        
        //Tap on slider
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    
    @IBAction func dimissController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {});
    }
    
    
    
    // MARK: - Objective C
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    
    
}
