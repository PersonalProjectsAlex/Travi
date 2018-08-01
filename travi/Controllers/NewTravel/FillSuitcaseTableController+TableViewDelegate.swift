//
//  FillSuitcaseTableController+TableViewDelegate.swift
//  travi
//
//  Created by Administrador on 19/04/18.
//

import Foundation
import UIKit

extension FillSuitcaseTableController{
    
    // MARK: - Table view data source
    
    //height for rows
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 0 : 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.cellIdentidentifier, for: indexPath) as? ProductsHomeCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.array.append("Alex")
        performSegue(withIdentifier: Segues.HomeToProductsDetails, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 40
    }
    

    
}
