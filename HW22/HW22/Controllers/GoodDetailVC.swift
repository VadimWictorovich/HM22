//
//  GoodDetailVC.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import Cosmos
import UIKit

final class GoodDetailVC: UIViewController {
    var index: Int!
    private var good: Good {
        GoodsData.shared.goods[index]
    }

    @IBOutlet private weak var imageViewOutlet: UIImageView!
    @IBOutlet private weak var colorGoodLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var buttonShowOutlet: UIButton!
    @IBOutlet private weak var stackview: UIStackView!
    @IBOutlet private weak var cosmosView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUICosmos()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUI(with: size)
    }
    
    private func updateUI(with size: CGSize) {
        let isVertical = size.width < size.height
        stackview.axis = isVertical ? .vertical : .horizontal
        title = good.name
        imageViewOutlet.image = good.image
        priceLabel.text = good.price.description + " $"
        colorGoodLabel.text = good.colorAndRAM
    }
    
    private func setupUICosmos() {
        let sumRatings = good.ratings.reduce(0.0, +)
        cosmosView.rating = good.ratings.count != 0 ? sumRatings / Double(good.ratings.count) : 0.0
        cosmosView.settings.updateOnTouch = false
        cosmosView.settings.fillMode = .half
        cosmosView.settings.starSize = 30
        cosmosView.settings.starMargin = 5.3
    }
    
    @IBAction private func showReviewAction() {
        if cosmosView.rating != 0.0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "ReviewTVC") as? ReviewTVC else { return }
            vc.index = self.index
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "ОШИБКА",
                                          message: "Отзывы о данном устройстве отсутствуют!",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction private func leaveReviewAction() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "LeaveReviewVC") as? LeaveReviewVC else { return }
        vc.index = self.index
        navigationController?.pushViewController(vc, animated: true)
    }
}
