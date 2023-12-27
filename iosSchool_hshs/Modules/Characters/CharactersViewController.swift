//
//  CharactersViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import UIKit

class CharactersViewController<View: CharactersView>: BaseViewController<View> {
    var selectCharacter: ((CharactersCellData) -> Void)?
    private var characters: [Character] = []
    private let charactersDataProvider: CharactersDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageService: ImageService

    init(charactersDataProvider: CharactersDataProvider, data: LocationsCellData, imageService: ImageService) {
        self.charactersDataProvider = charactersDataProvider
        charactersUrlList = data.residents
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")

        rootView.setView()
        rootView.update(data: CharactersViewData(cells: charactersUrlList.map { CharactersCellData(url: $0) }))
        let selectClosure: ((CoreCellInputData) -> Void)? = { [weak self] data in
            guard let data = data as? CharactersCellData else {
                return
            }
            self?.selectCharacter?(data)
        }
        charactersUrlList.enumerated().forEach { idx, url in
            requestCharacter(url: url) { [weak self] character in
                guard let self else {
                    return
                }
                DispatchQueue.main.async {
                    self.rootView.updateCharacter(idx: idx, with: CharactersCellData.init(
                        character: character,
                        isLoading: true,
                        image: nil,
                        selectClosure: selectClosure
                    ))
                }
                self.imageService.getImage(url: character.image, completion: { [weak self] image in
                    DispatchQueue.main.async {
                        self?.rootView.updateCharacter(idx: idx, with: CharactersCellData.init(
                            character: character,
                            isLoading: false,
                            image: image,
                            selectClosure: selectClosure
                        ))
                    }
                })
            }
        }
    }

    // MARK: - Private methods

    private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.charactersDataProvider.character(url: url) { [weak self] character, _ in
                guard let character else {
                    return
                }
                self?.updateQueue.async {
                    self?.characters.append(character)
                    completion(character)
                }
            }
        }
    }
}
