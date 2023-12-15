//
//  PersonPhotoCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.12.2023.
//

import Foundation

struct PersonPhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
}
