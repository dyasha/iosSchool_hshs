//
//  ViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let generator = ColorGenerator(alpha: 0.5)
        let superGenerator: ColorGeneratorProtocol = ColorGenerator(alpha: 1)
    }
}
