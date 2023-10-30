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
        print(superGenerator)

        let generatorOne = ColorGenerator(alpha: 1)
        generatorOne.changeColorCodes { colorCodes in
            print(colorCodes)
        }
        generatorOne.changeColor {
            [0, 100, 200]
        }
    }
}
