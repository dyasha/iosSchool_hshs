//
//  SplashCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 09.11.2023.
//

import UIKit

class SplashCoordinator: BaseCoordinator<SplashCoordinator.Context> {

    struct Context {
        let onSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.splashVC(onSucces: context.onSuccess)
    }
}
