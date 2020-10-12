//
//  ProductCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 09/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit

protocol ProductCellDelegate: class {
    func didSelectRow(at product: Product)
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let productCellIdentifier = "productCell"
    weak var delegate: ProductCellDelegate?
    var products: [Product]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }
    
    private func setupCollection() {
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.productCollectionCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInsetReference = .fromContentInset
            layout.minimumInteritemSpacing = 50
            layout.minimumLineSpacing = 30
            layout.invalidateLayout()
            collectionView.preservesSuperviewLayoutMargins = true
        }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.alwaysBounceVertical = false
    }
    
    func configure(_ viewModel: [Product]?) {
        products = viewModel
        collectionView.reloadData()
    }
    
}

extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = products?[indexPath.row] else { return }
        delegate?.didSelectRow(at: product)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.productCollectionCell, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(products?[indexPath.row])
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}


