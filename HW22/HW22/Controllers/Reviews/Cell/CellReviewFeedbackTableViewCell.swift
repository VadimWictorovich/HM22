//
//  CellReviewFeedbackTableViewCell.swift
//  HW22
//
//  Created by Вадим Игнатенко on 26.09.23.
//

import Cosmos
import UIKit

class CellReviewFeedbackTableViewCell: UITableViewCell {
    
    @IBOutlet var namelabel: UILabel!
    @IBOutlet var textFeetback: UILabel!
    @IBOutlet var dateFeetbackLabel: UILabel!
    @IBOutlet var cosmosView: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
