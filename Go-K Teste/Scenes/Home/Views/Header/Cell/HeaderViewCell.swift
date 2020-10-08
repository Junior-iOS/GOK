//
//  HeaderViewCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderViewItem {
    let response: Home.Response?
    
    init(response: Home.Response?) {
        self.response = response
    }
}

class HeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var imgContent: UIImageView!
    
    static let headerViewdentifier = "headerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Home.Response?) {
        guard let viewModel = viewModel, let spotlights = viewModel.spotlight else { return }
        for product in spotlights {
            imgContent?.sd_setImage(with: URL(string: product.bannerURL), completed: nil)
        }
    }

}
