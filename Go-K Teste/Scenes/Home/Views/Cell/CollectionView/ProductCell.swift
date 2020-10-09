//
//  ProductCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 08/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var imgContent: UIImageView!
    
    static let productCellIdentifier = "productCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Home.Response?) {
        guard let products = viewModel?.products else { return }
        for product in products {
            imgContent.sd_setImage(with: URL(string: product.imageURL), completed: nil)
        }
    }

}
