//
//  LeaveReviewVC.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import Cosmos
import UIKit

final class LeaveReviewVC: UIViewController {
    var index: Int!
    private let data = GoodsData.shared
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var cenretConsrtaint: NSLayoutConstraint!
    @IBOutlet private weak var textOut: UITextView!
    @IBOutlet private weak var cosmosView: CosmosView! { didSet { cosmosView.settings.starSize = 40 } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        cenretConsrtaint.constant -= keyboardSize.height / 2
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        cenretConsrtaint.constant += keyboardSize.height / 2
    }
    
    @IBAction private func saveAction() {
        guard
            let text = textOut.text.isEmpty ? "No commets" : textOut.text,
            let name = textField.text!.isEmpty ? "Anonim" : textField.text
        else { return }
        
        let feed = Feedback(text: text,
                            userName: name,
                            mark: cosmosView.rating)
        guard let ind = index else { return }
        data.goods[ind].feedback.append(feed)
        data.goods[ind].ratings.append(feed.mark)
        navigationController?.popViewController(animated: true)
    }
}
