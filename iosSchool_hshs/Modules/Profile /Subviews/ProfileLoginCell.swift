//
//  ProfileLoginCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

class ProfileLoginCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var loginLabel: UILabel!

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(27)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(27)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: ProfileLoginCellData) {
        loginLabel.text = inputData.login
    }
}
