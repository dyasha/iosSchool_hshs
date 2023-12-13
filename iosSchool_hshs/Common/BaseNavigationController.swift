//
//  BaseNavigationController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 23.11.2023.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate,
    UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor(named: "iceberg")
        navigationBar.barTintColor = UIColor(named: "iceberg")
        view.backgroundColor = UIColor(named: "iceberg")
        navigationBar.tintColor = UIColor.black
    }

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
