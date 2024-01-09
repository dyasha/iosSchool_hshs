//
//  ProfileVIewData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

struct ProfileViewData {
    let profilePhotoCellData: ProfilePhotoCellData
    let profileLoginCellData: ProfileLoginCellData
    let profileFieldCellData: [ProfileFieldCellData]
    let profileButtonCellData: ProfileButtonCellData

    init(
        image: UIImage?,
        login: String?,
        date: String?,
        color: UIColor?,
        onLogout: ((CoreCellInputData) -> Void)?
    ) {
        profilePhotoCellData = ProfilePhotoCellData(image: image)
        profileLoginCellData = ProfileLoginCellData(login: login)
        profileFieldCellData = [
            ProfileFieldCellData(date: date, color: nil, showDate: true),
            ProfileFieldCellData(date: nil, color: color, showDate: false)
        ]
        profileButtonCellData = ProfileButtonCellData(selectClosure: onLogout)
    }
}
