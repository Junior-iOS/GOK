//
//  SpotlightCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 09/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit

protocol SpotlightCellDelegate: class {
    func didSelectRowAt(_ indexPath: IndexPath)
}

class SpotlightCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let spotlightCellIdentifier = "spotlightCellIdentifier"
    var spotlights: [Spotlight]?
    weak var delegate: SpotlightCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }
    
    private func setupCollection() {
        collectionView.register(UINib(nibName: "SpotlightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SpotlightCollectionViewCell.spotlightCollectionCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInsetReference = .fromContentInset
            layout.minimumInteritemSpacing = 20
            layout.minimumLineSpacing = 0
            layout.invalidateLayout()
            collectionView.preservesSuperviewLayoutMargins = true
        }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
    }
    
    func configure(_ viewModel: [Spotlight]?) {
        spotlights = viewModel
        collectionView.reloadData()
    }
    
}

extension SpotlightCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectRowAt(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotlights?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCollectionViewCell.spotlightCollectionCell, for: indexPath) as? SpotlightCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(spotlights?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 50, height: 150)
    }
    
}
