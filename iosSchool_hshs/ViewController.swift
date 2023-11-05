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
        let characterGenerator: CharacterGeneratorProtocol = CharacterGenerator()
        let character = characterGenerator.generate().characterInfo()
        let objectCharacterGenerator = CharacterGenerator().generate().characterInfo()
        print(character, objectCharacterGenerator)

        CharacterGenerator().generateNameOne(completion: { print($0) })
        CharacterGenerator().generateNameTwo(completion: { "Ivan" })
        CharacterGenerator().generateNameTree()("Olga")
        print(CharacterGenerator().generateNameFour()())
    }
}
