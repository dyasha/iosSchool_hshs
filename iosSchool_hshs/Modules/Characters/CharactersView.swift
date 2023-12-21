//
//  CharactersView.swift
//  iosSchool_hshs
//
//  Created by Владислав Береснев on 15.11.2023.
//

import UIKit

protocol CharactersView: UIView {
    func setView()
    func update(data: CharactersViewData)
    func updateCharacter(idx: Int, with data: CharactersCellData)
}

class CharactersViewImp: UIView, CharactersView {
    private var section: CoreSection?

    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout())
    }()

    func setView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func update(data: CharactersViewData) {
        section = CharactersSection(cellsData: data.cells)
        section?.registrate(collectionView: collectionView)
        collectionView.reloadData()
    }

    func updateCharacter(idx: Int, with data: CharactersCellData) {
        section?.updateCell(at: IndexPath(item: idx, section: 0), with: data)
        guard let cell = section?.cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: idx, section: 0)
        ) as? CharactersCell else {
            return
        }
        cell.update(with: data)
    }

    // MARK: - Private methods

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let charactersSection = self.section else {
                return nil
            }

            guard let layoutSection = charactersSection.sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CharactersViewImp: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        self.section?.numberOfItem ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        section?.cell(
            collectionView: collectionView,
            indexPath: indexPath
        ) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension CharactersViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        section?.selectCell(at: indexPath.item)
    }
}

private extension CharactersViewImp {
    typealias CharactersSection = Section<CharactersCell, EmptyReusableView, EmptyReusableView>
}
