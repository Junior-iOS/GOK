//
//  CashCell.swift
//  Go-K Teste
//
//  Created by Junior Silva on 08/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import UIKit
import SDWebImage

class CashCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgContent: UIImageView!
    
    static let cashCellIdentifier = "cashCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgContent.layer.cornerRadius = 10
    }

    func configure(_ viewModel: Cash?) {
        guard let cash = viewModel else { return }
        lblTitle.text = cash.title
        imgContent.sd_setImage(with: URL(string: cash.image), completed: nil)
    }
    
}
