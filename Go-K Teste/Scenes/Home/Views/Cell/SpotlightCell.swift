//
//  HomeCollectionViewCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 08/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class SpotlightCell: UICollectionViewCell {

    @IBOutlet weak var imgContent: UIImageView!
    
    static let spotlightCellIdentifier = "spotlightCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Home.Response?) {
        guard let spotlights = viewModel?.spotlight else { return }
        for spotlight in spotlights {
            imgContent.sd_setImage(with: URL(string: spotlight.bannerURL), completed: nil)
        }
    }

}
