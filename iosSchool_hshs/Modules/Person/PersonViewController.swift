//
//  PersonViewController.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 13.12.2023.
//

import UIKit

class PersonViewController<View: PersonView>: BaseViewController<View> {
    private var episodes: [Episode] = []
    private let dataProvider: PersonDataProvider
    private let episodesUrlList: [String]
    private let imageService: ImageService
    private let imageUrl: String?
    private let updateQueue = DispatchQueue(label: "EpisodeRequestQueue")

    init(dataProvider: PersonDataProvider, data: CharactersCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.episodesUrlList = data.episodes
        self.imageService = imageService
        self.imageUrl = data.imageUrl
        super.init(nibName: nil, bundle: nil)
        title = data.name
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-color")

        rootView.setView()
        if let imageUrl = imageUrl {
            imageService.getImage(url: imageUrl , completion: { [weak self] image in
                guard let image else {
                    return
                }
                DispatchQueue.main.async {
                    self?.rootView.update(data: .init(image: image, episodeUrls: self?.episodesUrlList ?? []))
                }
            })
        }
        self.episodesUrlList.enumerated().forEach { idx, url in
            requestEpisode(url: url) { [weak self] episode in
                guard let self else {
                    return
                }
                DispatchQueue.main.async {
                    self.rootView.updateEpisode(
                        idx: idx,
                        with: PersonEpisodeCellData.init(episode: episode)
                    )
                }
            }
        }
    }

// MARK: - Private methods

    private func requestEpisode(url: String, completion: @escaping (Episode) -> Void) {
        DispatchQueue.global().async {
            self.dataProvider.episode(url: url) { episode, _ in
                guard let episode else {
                    return
                }
                self.updateQueue.async {
                    self.episodes.append(episode)
                    completion(episode)

                }
            }
        }
    }
}
