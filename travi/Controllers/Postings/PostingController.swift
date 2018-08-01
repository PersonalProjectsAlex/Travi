//
//  PostingController.swift
//  travi
//
//  Created by Administrador on 29/04/18.
//

import UIKit
import TLPhotoPicker

class PostingController: UIViewController ,TLPhotosPickerViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    // MARK: - Let-Var
    var selectedAssets = [TLPHAsset]()
    
    
    // MARK: - Outlets
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        Core.shared.registerCellCollection(at: photosCollectionView, named: CellIdentifier.selectedPhotos)
        
        // setting up UI elements to be used throught the code
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(selectedAssets.count)
        photosCollectionView.reloadData()
        
    }

    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK: - SetUps / Funcs
    func setUpUI(){
        
        //NavigationController
        Core.shared.generalNavigation(at: self)
        
        //Setting Custom Image on Left Bar Button
        Core.shared.setImageOnLeftBarButton(image: #imageLiteral(resourceName: "LogoText"), at: self)
        
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        // use selected order, fullresolution image
        self.selectedAssets = withTLPHAssets

    }

    @IBAction func pickerButtonTap() {
        let viewController = CustomPhotoPickerViewController()
        viewController.delegate = self
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        configure.numberOfColumn = 3
        //configure.maxSelectedAssets
        viewController.configure = configure
        viewController.selectedAssets = self.selectedAssets
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    

    func photoPickerDidCancel() {
        // cancel
    }
    
    func dismissComplete() {
        // picker dismiss completion
    }
    
    func didExceedMaximumNumberOfSelection(picker: TLPhotosPickerViewController) {
        self.showExceededMaximumAlert(vc: picker)
    }
    
    func handleNoAlbumPermissions(picker: TLPhotosPickerViewController) {
        picker.dismiss(animated: true) {
            let alert = UIAlertController(title: "", message: "Denied albums permissions granted", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        let alert = UIAlertController(title: "", message: "Denied camera permissions granted", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        picker.present(alert, animated: true, completion: nil)
    }

    
    // CollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedAssets.count == 0 ? 1 : selectedAssets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.selectedPhotos, for: indexPath) as? SelectedProductCell else { return UICollectionViewCell() }
        
        if self.selectedAssets.count > 0{
            cell.selectedImage.image = self.selectedAssets[indexPath.row].fullResolutionImage
        }else{
            cell.selectedImage.image = #imageLiteral(resourceName: "EmptyStateImage")
        }
        
        return cell
    }
    

}
