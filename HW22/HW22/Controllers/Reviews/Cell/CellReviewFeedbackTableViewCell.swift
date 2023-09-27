//
//  CellReviewFeedbackTableViewCell.swift
//  HW22
//
//  Created by Вадим Игнатенко on 26.09.23.
//

import UIKit
import Cosmos

class CellReviewFeedbackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var textFeetback: UILabel!
    @IBOutlet weak var dateFeetbackLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
