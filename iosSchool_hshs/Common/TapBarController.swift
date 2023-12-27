//
//  TapBarController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 23.11.2023.
//

import UIKit

class TabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "iceberg")
        tabBar.barTintColor = UIColor(named: "iceberg")
        tabBar.backgroundColor = UIColor(named: "iceberg")
        tabBar.isTranslucent = false
        tabBar.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
