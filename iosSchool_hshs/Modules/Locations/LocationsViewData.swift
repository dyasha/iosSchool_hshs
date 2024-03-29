//
//  LocationsViewData.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 14.11.2023.
//

import Foundation

struct LocationsViewData {
    let cellsData: [LocationsCellData]

    init(list: LocationsList) {
        cellsData = list.results.map { LocationsCellData(locations: $0) }
    }
}
