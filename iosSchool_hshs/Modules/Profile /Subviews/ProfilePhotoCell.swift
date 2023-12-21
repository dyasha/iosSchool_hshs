//
//  ProfilePhotoCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

class ProfilePhotoCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var imageView: UIImageView!
    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(377)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(377)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: ProfilePhotoCellData) {
        imageView.image = inputData.image
    }
}
