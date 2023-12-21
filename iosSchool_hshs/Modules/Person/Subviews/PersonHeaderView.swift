//
//  PersonHeaderView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.12.2023.
//

import UIKit

class PersonHeaderView: UICollectionReusableView, CoreReusableView {
    typealias InputData = PersonHeaderViewData

    @IBOutlet private weak var titleLable: UILabel!

    override func awakeFromNib() {
        titleLable.font = UIFont.systemFont(ofSize: 18)
    }

    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(55)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return header
    }

    func update(with inputData: PersonHeaderViewData) -> Self {
        titleLable.text = inputData.title
        return self
    }

}
