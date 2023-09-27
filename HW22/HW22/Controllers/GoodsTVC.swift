//
//  GoodsTVC.swift
//  HW22
//
//  Created by Вадим Игнатенко on 21.09.23.
//

import UIKit

class GoodsTVC: UITableViewController {

    var goods: [Good] {
        GoodsData.shared.goods
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let good = goods[indexPath.row]
        CellManager.configure(cell: cell, with: good)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard
            let indexPath = tableView.indexPathForSelectedRow,
            let vc = sb.instantiateViewController(withIdentifier: "GoodDetailVC") as? GoodDetailVC
        else { return }
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}
