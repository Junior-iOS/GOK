//
//  ProductCollectionViewCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 09/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgContent: UIImageView!
    
    static let productCollectionCell = "productCollectionCell"

    func configure(_ viewModel: Product?) {
        guard let product = viewModel else { return }
        print(product.title)
        imgContent.sd_setImage(with: URL(string: product.image), completed: nil)
    }

}
