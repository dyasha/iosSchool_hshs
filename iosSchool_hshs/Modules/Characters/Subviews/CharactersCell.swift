//
//  CharactersCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 07.12.2023.
//

import UIKit

class CharactersCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var genderSpeciesLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
           super.awakeFromNib()
           setupUI()
       }

    private func setupUI() {
        layer.cornerRadius = 15
        layer.masksToBounds = false
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "iceberg")?.cgColor
        layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(167)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(167)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(24)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        return section
    }

    func update(with inputData: CharactersCellData) {
        if inputData.isLoading == true {
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            imageView.image = inputData.image
            nameLabel.text = inputData.name
            genderSpeciesLabel.text = inputData.genderSpecies
        }
    }
}
