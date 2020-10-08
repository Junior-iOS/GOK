//
//  HeaderView.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Home.Response]?
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCollectionView()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupCollectionView()
//    }
    
    func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HeaderViewCell", bundle: nil), forCellWithReuseIdentifier: HeaderViewCell.headerViewdentifier)
        collectionView.backgroundColor = .clear
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 10, height: 50)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 62, bottom: 0, right: 124)
        }
    }
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.headerViewdentifier, for: indexPath) as? HeaderViewCell else { return UICollectionViewCell() }
        
        if let menuItem = items?[indexPath.row] {
            cell.configure(menuItem)
        }
        return cell
    }
    
}

class NibView: UIView {

    var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
}
private extension NibView {
    
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
