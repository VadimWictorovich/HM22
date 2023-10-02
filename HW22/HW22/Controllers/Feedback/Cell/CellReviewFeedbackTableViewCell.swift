//
//  CellReviewFeedbackTableViewCell.swift
//  HW22
//
//  Created by Вадим Игнатенко on 26.09.23.
//

import Cosmos
import UIKit

final class CellReviewFeedbackTableViewCell: UITableViewCell {
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var textFeetback: UILabel!
    @IBOutlet var dateFeetbackLabel: UILabel!
    @IBOutlet var cosmosView: CosmosView! { didSet { cosmosView.settings.updateOnTouch = false } }
}
