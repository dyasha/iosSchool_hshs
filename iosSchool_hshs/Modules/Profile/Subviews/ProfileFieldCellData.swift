//
//  ProfileFieldCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 20.12.2023.
//

import UIKit

struct ProfileFieldCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let date: String?
    let color: UIColor?
    let showDate: Bool

    init(date: String?, color: UIColor?, showDate: Bool) {
        self.date = date ?? ".. .. ...."
        self.color = color ?? .black
        self.showDate = showDate
    }
}
