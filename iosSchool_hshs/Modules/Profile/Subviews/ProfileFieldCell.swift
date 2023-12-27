//
//  ProfileFieldCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 20.12.2023.
//

import UIKit

class ProfileFieldCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var sectionView: UIView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = false
        configureLabel(label: sectionView)
        colorView.layer.cornerRadius = 10
        colorView.clipsToBounds = false
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(98)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(18)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: ProfileFieldCellData) {
        if inputData.showDate {
            textLabel.text = "Дата входа"
            dateLabel.text = inputData.date
            colorView.isHidden = true
            dateLabel.isHidden = false
        } else {
            textLabel.text = "Цвет профиля"
            colorView.backgroundColor = inputData.color
            dateLabel.isHidden = true
            colorView.isHidden = false
        }
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
