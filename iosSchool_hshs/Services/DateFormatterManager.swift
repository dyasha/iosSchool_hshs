//
//  DateFormatterManager.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 20.12.2023.
//

import Foundation

protocol DateFormatterManager {
    func formate(date: Date?) -> String?
}

class DateFormatterManagerImp: DateFormatterManager {
    private let dateFormatter: DateFormatter

    init() {
        dateFormatter = DateFormatter()
    }

    func formate(date: Date?) -> String? {
        guard let date else {
            return nil
        }
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
