//
//  ReviewTVC.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import UIKit

final class ReviewTVC: UITableViewController {
    var index: Int!
    private var feedback: [Feedback] {
        GoodsData.shared.goods[index].feedback
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedback.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellReviewFeedbackTableViewCell
        let feed = feedback[indexPath.row]
        cell.namelabel.text = "Пользователь: \(feed.userName)"
        cell.textFeetback.text = "'\(feed.text)'"
        cell.dateFeetbackLabel.text = feed.date
        cell.cosmosView.rating = feed.mark
        return cell
    }
}
