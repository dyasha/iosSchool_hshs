//
//  ProfileButtonCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 20.12.2023.
//

import Foundation

struct ProfileButtonCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
}
