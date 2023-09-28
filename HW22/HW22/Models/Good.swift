//
//  ObjectModel.swift
//  HW22
//
//  Created by Вадим Игнатенко on 21.09.23.
//

import UIKit

struct Good {
    let name: String
    let price: Double
    //let rating: Double
    let image: UIImage?
    let colorAndRAM: String?
    var feedback: [Feedback] = []
    var ratings: [Double] = []
}
