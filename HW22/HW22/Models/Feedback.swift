//
//  Feedback.swift
//  HW22
//
//  Created by Вадим Игнатенко on 21.09.23.
//

import Foundation

struct Feedback {
    var date: String = {
        let currentDate = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh.mm"
        let timeString = timeFormatter.string(from: currentDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        let formattedDate = "дата отзыва: \(dateString) \nвремя отзыва: \(timeString)"
        return formattedDate
    }()
    var text: String
    var userName: String
    var mark: Double
}
