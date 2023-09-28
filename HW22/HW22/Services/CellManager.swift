//
//  CellManager.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import Foundation
import UIKit


class CellManager {
    
    static func configure (cell: UITableViewCell,with good: Good) {
        cell.textLabel?.text = good.name
        cell.detailTextLabel?.text = String(good.price) + " $"
        cell.imageView?.image = good.image
    }
}
