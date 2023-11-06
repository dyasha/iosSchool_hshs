//
//  Assembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 26.10.2023.
//

import Foundation

class Assembly {

    func coloerGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assemlby: self, context: .init())
    }
}
