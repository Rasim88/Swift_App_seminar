//
//  PhotosViewController.swift
//  Seminar7
//
//  Created by Расим on 22.07.2023.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    private var networkService: NetworkServiceProtocol
    private var models: [Photo] = []

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.photoCellIdentifier)
        networkService.getPhotos { [weak self] photos in
            self?.models = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.photoCellIdentifier, for: indexPath) as? PhotoCell else {
            fatalError("Unable to dequeue a PhotoCell")
        }
        let model = models[indexPath.row]
        // Обновите ячейку по необходимости
        return cell
    }



}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}


