//
//  HomeTableViewCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    
    static let homeCellIdentifier = "homeCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Home.Response?) {
        guard let viewModel = viewModel, let image = viewModel.cash?.bannerURL else { return }
        lblTitle.text = viewModel.cash?.title
        imgContent?.sd_setImage(with: URL(string: image), completed: nil)
    }
    
}
