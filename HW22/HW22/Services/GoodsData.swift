//
//  GoodsData.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import Foundation


class GoodsData {
    
    static let shared = GoodsData()
    var goods: [Good]
    private init () {
        goods = [Good(name: "iPhone 7", price: 399, image:#imageLiteral(resourceName: "iPhone 7.png") , colorAndRAM: "Pink, 32 ГБ"),
                 Good(name: "iPhone 11", price: 499, image: #imageLiteral(resourceName: "iPhone 11.png"), colorAndRAM: "Blue, 64 ГБ"),
                 Good(name: "iPhone 12 Pro", price: 799, image: #imageLiteral(resourceName: "iPhone 12 Pro.png"), colorAndRAM: "Blue, 128 ГБ"),
                 Good(name: "iPhone 13 mini", price: 699, image: #imageLiteral(resourceName: "iPhone 13 mini.png"), colorAndRAM: "Red, 64 ГБ"),
                 Good(name: "iPhone 14 Pro Max", price: 999, image: #imageLiteral(resourceName: "iPhone 14 Pro Max.png"), colorAndRAM: "Violet, 512 ГБ") ]
    }
}
