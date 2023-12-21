//
//  ProfileFieldCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 20.12.2023.
//

import UIKit

class ProfileFieldCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var dateView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var colorCircleView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        configureLabel(label: dateView)
        configureLabel(label: colorView)
        colorCircleView.layer.cornerRadius = 10
        colorCircleView.clipsToBounds = false
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(98)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(98)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: ProfileFieldCellData) {
        dateLabel.text = inputData.date
        colorCircleView.backgroundColor = inputData.color
    }

    // MARK: - Private methods

    private func configureLabel(label: UIView) {
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 1
        label.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 8
        label.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
