//
//  PersonViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 13.12.2023.
//

import Foundation

class PersonViewController<View: PersonView>: BaseViewController<View> {
    private let dataProvider: PersonDataProvider
    private let episodes: [String]

    init(dataProvider: PersonDataProvider, data: CharactersCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.episodes = data.episodes
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        rootView.setView()
        rootView.update(data: .init(image: nil, episodeUrls: episodes))
    }
}
