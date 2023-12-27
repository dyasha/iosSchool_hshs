//
//  PersonEpisodeCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.12.2023.
//

import UIKit

class PersonEpisodeCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var numberView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    override func awakeFromNib() {
        layer.cornerRadius = 15
        numberView.layer.cornerRadius = 16
        numberView.clipsToBounds = false
        numberView.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        numberView.layer.shadowOpacity = 0.3
        numberView.layer.shadowOffset = CGSize(width: 0, height: 4)
        numberView.layer.shadowRadius = 4
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(top: 33, leading: 16, bottom: 50, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number
        nameLabel.text = inputData.name
        dateLabel.text = inputData.airDate
    }
}
