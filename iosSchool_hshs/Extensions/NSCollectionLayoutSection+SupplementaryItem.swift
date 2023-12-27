//
//  NSCollectionLayoutSection+SupplementaryItem.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.12.2023.
//

import UIKit

extension NSCollectionLayoutSection {
    func add(supplementaryItem: NSCollectionLayoutBoundarySupplementaryItem?) -> Self {
        if let supplementaryItem = supplementaryItem {
            boundarySupplementaryItems.append(supplementaryItem)
        }
        return self
    }
}
