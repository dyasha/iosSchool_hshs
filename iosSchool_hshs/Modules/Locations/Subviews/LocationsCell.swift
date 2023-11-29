//
//  LocationsCell.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 27.11.2023.
//

import UIKit

class LocationsCell: UITableViewCell {
    var data: LocationsCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var residentsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

// MARK: - Private methods

    private func update(data: LocationsCellData) {
        nameLabel.text = data.name
        typeLabel.text = data.type
        residentsLabel.text = "Население: " + String(data.residents.count)
    }
}
