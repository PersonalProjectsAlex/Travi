//
//  ProductsHomeCell.swift
//  travi
//
//  Created by Administrador on 29/03/18.
//

import UIKit
import SDWebImage

class ProductsHomeCell: UITableViewCell {

    var commerce: Bases?{
        didSet {
            setupCell()
        }
    }
    
    
    // MARK: - Let-Var
    var commerces: Bases?
    // MARK: - Outlets
    
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    

    override func prepareForReuse() {
        
        commerce = nil
        
    }
    
    // MARK: SETUPS/LOADERS
    
    func setupCell() {
        
        guard let data = commerce else{
            print("Issue in dataResponse")
            return
        }
        
        shortDescriptionLabel.text = data.itemName
        productImageView.sd_setImage(with: URL(string: data.itemCoverUrl!), placeholderImage: #imageLiteral(resourceName: "EmptyImage"))
        
    }
    
    
    
}
