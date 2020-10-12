//
//  SpotlightCollectionViewCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 09/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgContent: UIImageView!
    
    static let spotlightCollectionCell = "spotlightCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Spotlight?) {
        guard let spotlight = viewModel else { return }
        imgContent.sd_setImage(with: URL(string: spotlight.image), completed: nil)
    }

}
