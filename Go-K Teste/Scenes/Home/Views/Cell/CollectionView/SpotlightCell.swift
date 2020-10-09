//
//  HomeCollectionViewCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 08/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class SpotlightCell: UITableViewCell {

    @IBOutlet weak var imgContent: UIImageView!
    
    static let spotlightCellIdentifier = "spotlightCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Spotlight?) {
        guard let spotlight = viewModel else { return }
        imgContent.sd_setImage(with: URL(string: spotlight.bannerURL), completed: nil)
    }

}
