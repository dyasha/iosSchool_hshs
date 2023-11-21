//
//  AuthViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 06.11.2023.
//

import UIKit

class AuthViewController<View: AuthView>: BaseViewController<View> {

    private let dataProvider: AuthDataProvider

    init(dataProvider: AuthDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        login()
    }

    func login() {
        dataProvider.auth(login: "Va", password: "1234") { token, error in
            print(token ?? "нет токена")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
