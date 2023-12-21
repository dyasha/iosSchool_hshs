//
//  ProfileCoordinator.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import UIKit

class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {
    struct Context {
        let onLogout: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.profileVC(onLogout: context.onLogout)
    }
}
