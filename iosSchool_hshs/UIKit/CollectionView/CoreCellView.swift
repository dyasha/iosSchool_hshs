//
//  CoreCellView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 07.12.2023.
//

import UIKit

protocol CoreCellView: UICollectionViewCell, CoreNibReusable {
    associatedtype InputData: CoreCellInputData

    static func layoutSection() -> NSCollectionLayoutSection
    func update(with inputData: InputData)
}
