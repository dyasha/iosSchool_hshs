//
//  CoreCellInputData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 07.12.2023.
//

import Foundation

protocol CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)? { get }
}
