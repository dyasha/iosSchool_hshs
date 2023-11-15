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
        let color = Color(red: 1, green: 1, blue: 1)
        let intArray = generator.convertToArray(element: 1)
        let colorArr = generator.convertToArray(element: color)
        let stringArray = generator.convertToArray(element: "Hello World!")

        let palette = Palette(colors: [1, 2, 3, 4])
        let anotherPalette = Palette(colors: ["red", "green"])
        let colorPalette = Palette(colors: [color])
        let pal = Palette(colors: colorArr)

        let arrayInt = [1, 2, 3, 4, 5, 6, 7, 8]
        let result = arrayInt.filter {elem in
            return elem % 2 == 0
        }
        let result1 = arrayInt.filter { $0 % 2 == 0}
        let array = [0.1, 0.2, 0.5, 1]
        let gener = array.map { ColorGenerator(alpha: $0) }
        let test = array.map {alpha -> ColorGeneratorProtocol? in
            guard alpha < 1 else {
                return nil
            }
            return ColorGenerator(alpha: alpha)
        }
        let test1: [ColorGenerator?] = array.map {
            guard $0 < 1 else {
                return nil
            }
            return ColorGenerator(alpha: $0)
        }
        let test2 = test1.compactMap { $0 }
        let test3 = test1.compactMap { $0?.alpha }
        let test4 = test1.map { $0?.alpha }

        let generateForNames = CharacterGenerator().genderForName.keys.map { CharacterGenerator().generate(name: $0) }
        let generateForEpisodes = (0...2).map { _ in
            CharacterGenerator().episodes.map { CharacterGenerator().generate(episodes: [$0]) }
        }
        let generateForEpisodesCompactMap = (0...2).map { _ in
            CharacterGenerator().episodes.compactMap { CharacterGenerator().generate(episodes: [$0]) }
        }
    }
}
