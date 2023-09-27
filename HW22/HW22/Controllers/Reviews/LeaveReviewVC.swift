//
//  LeaveReviewVC.swift
//  HW22
//
//  Created by Вадим Игнатенко on 25.09.23.
//

import Cosmos
import UIKit

class LeaveReviewVC: UIViewController {
    var index: Int!
    let data = GoodsData.shared
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cenretConsrtaint: NSLayoutConstraint!
    @IBOutlet weak var textOut: UITextView!
    @IBOutlet weak var cosmosView: CosmosView! { didSet { cosmosView.settings.starSize = 40 } }
    
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
    
    @IBAction func saveAction() {
        let feed = Feedback(text: textOut.text,
                            userName: textField.text ?? "Anonim",
                            mark: cosmosView.rating)
        guard let ind = index else { return }
        data.goods[ind].feedback.append(feed)
        navigationController?.popViewController(animated: true)
    }
}
