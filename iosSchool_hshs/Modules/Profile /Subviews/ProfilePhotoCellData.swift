//
//  ProfilePhotoCellData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

struct ProfilePhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let image: UIImage
}
