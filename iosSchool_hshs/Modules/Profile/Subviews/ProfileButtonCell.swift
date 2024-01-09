//
//  ProfileButtonCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 20.12.2023.
//

import UIKit

class ProfileButtonCell: UICollectionViewCell, CoreCellView {

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.cornerRadius = 10
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 102, leading: 16, bottom: 46, trailing: 16)
        return section
    }

    func update(with inputData: ProfileButtonCellData) {
    }
}
