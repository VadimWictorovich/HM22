//
//  ObjectModel.swift
//  HW22
//
//  Created by Вадим Игнатенко on 21.09.23.
//

import UIKit


struct Goods {
    private let name: String
    private let price: Double
    private let image: UIImage?
    
    private var feedback: [Feedback] = []
}
