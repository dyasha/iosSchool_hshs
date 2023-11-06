//
//  baseCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import Foundation
import UIKit

class BaseCoordinator<Context> {
    let assembly: Assembly
    let context: Context

    init(assemlby: Assembly, context: Context) {
        self.assembly = assemlby
        self.context = context
    }

    func make() -> UIViewController? {
        fatalError("This method is abstract")
    }
}
