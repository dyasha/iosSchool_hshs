//
//  StorageManager.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 04.12.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func saveToken(token: TokenResponse)
    func getToken() -> TokenResponse?
    func removeToken()
    func saveLastLoginDate()
    func getLastLoginDate() -> Date?
    func saveLogin(login: String)
    func getLogin() -> String?
}

class StorageManagerImp: StorageManager {
    private let keychain = Keychain(service: Constants.serviceId)

    func cleanKeychainIfNeeded() {
        guard !notFirstLaunch() else {
            return
        }
        do {
            try keychain.removeAll()
        } catch {
            print(error as Any)
        }
        saveFirstLaunch()
    }

    func saveToken(token: TokenResponse) {
        do {
            try keychain.set(token.token, key: StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func getToken() -> TokenResponse? {
        do {
            guard let token = try keychain.get(StorageManagerKey.token.rawValue) else {
                return nil
            }
            return TokenResponse(token: token)
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeToken() {
        do {
            try keychain.remove(StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func saveLastLoginDate() {
        UserDefaults.standard.set(Date(), forKey: StorageManagerKey.lastLoginDate.rawValue)
    }

    func getLastLoginDate() -> Date? {
        return UserDefaults.standard.object(forKey: StorageManagerKey.lastLoginDate.rawValue) as? Date
    }

    func saveLogin(login: String) {
        UserDefaults.standard.set(login, forKey: StorageManagerKey.login.rawValue)
    }

    func getLogin() -> String? {
        return UserDefaults.standard.object(forKey: StorageManagerKey.login.rawValue) as? String
    }
}

private extension StorageManagerImp {
    enum StorageManagerKey: String {
        case token
        case notFirstLaunch
        case lastLoginDate
        case login
    }

    struct Constants {
        static let serviceId = "StorageManagerKeychain.Service.Id"
    }

    func notFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
