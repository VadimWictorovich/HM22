//
//  CellManager.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import Foundation
import UIKit

final class CellManager {
    static func configure(cell: UITableViewCell, with good: Good) {
        
        let image = good.image
        let targetSize = CGSize(width: 100, height: 100)
        cell.textLabel?.text = good.name
        cell.detailTextLabel?.text = String(good.price) + " $"

        func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
            guard let image = image else {
                return nil
            }
            UIGraphicsBeginImageContext(targetSize)
            image.draw(in: CGRect(origin: CGPoint.zero, size: targetSize))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return resizedImage
        }

        if let resizedImage = resizeImage(image: image, targetSize: targetSize) {
            cell.imageView?.image = resizedImage
        } else {
            cell.imageView?.image = nil
        }
    }
}
