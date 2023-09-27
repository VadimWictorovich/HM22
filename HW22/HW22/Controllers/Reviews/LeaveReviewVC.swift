//
//  LeaveReviewVC.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import UIKit
import Cosmos

class LeaveReviewVC: UIViewController {
    var index: Int!
    let data = GoodsData.shared
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.starSize = 40
        }
    }
    @IBOutlet weak var textOut: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveAction() {
        let feed = Feedback(text: textOut.text, mark: cosmosView.rating)
        guard let ind = index else {return}
        data.goods[ind].feedback.append(feed)
        navigationController?.popViewController(animated: true)
    }
}
