//
//  CharactersViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import UIKit

class CharactersViewController: UIViewController {
    private let charactersDataProvider: CharactersDataProvider

    init(charactersDataProvider: CharactersDataProvider) {
        self.charactersDataProvider = charactersDataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        getCharacter(id: 1)
    }

    func getCharacter(id: Int) {
        charactersDataProvider.getCharacter(id: id) { character, error in
            print(character ?? "нет персонажа")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
