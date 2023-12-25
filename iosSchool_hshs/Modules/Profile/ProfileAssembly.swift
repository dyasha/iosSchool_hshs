//
//  ProfileAssembly.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 19.12.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileVC(onLogout: (() -> Void)?) -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
    func profileCoordinator(onLogout: (() -> Void)?) -> ProfileCoordinator
}

extension Assembly: ProfileAssembly {
    func profileVC(onLogout: (() -> Void)?) -> ProfileViewController<ProfileViewImp> {
        .init(onLogout: onLogout, storageManager: storageManager, dateFormatter: dateFormatter)
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp()
    }

    func profileCoordinator(onLogout: (() -> Void)?) -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init(onLogout: onLogout))
    }

}
