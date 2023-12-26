//
//  ProfileLoginCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

struct ProfileLoginCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let login: String?
}
