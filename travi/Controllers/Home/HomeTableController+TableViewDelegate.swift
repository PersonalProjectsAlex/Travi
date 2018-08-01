//
//  HomeTableController+TableViewDelegate.swift
//  travi
//
//  Created by Administrador on 29/03/18.
//

import Foundation
import UIKit

extension HomeTableController{
    
    // MARK: - Table view data source
    
    //height for rows
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    //Number of row per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let items = self.home {
            
            return section == 0 ? 0 : items.count
        }
        return 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.cellIdentidentifier, for: indexPath) as? ProductsHomeCell else { return UITableViewCell() }
        if let home = self.home {
            cell.commerce = home[indexPath.row]
        }
        
        
     return cell
     }
    
    //Selecting rows and setting action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.array.append("Alex")
        performSegue(withIdentifier: Segues.HomeToProductsDetails, sender: nil)
    }
    
    //Heigh for each header/section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 44
    }
    
    // Setting header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
       
        // Set a header for the table view
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        header.image = #imageLiteral(resourceName: "Header")
        header.clipsToBounds = true
        header.contentMode = .scaleAspectFill
        header.sizeToFit()
        v.addSubview(header)
        return header
    }
    


}
