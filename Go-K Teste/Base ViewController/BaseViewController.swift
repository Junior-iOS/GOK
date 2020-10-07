//
//  BaseViewController.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = .clear
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBar.isTranslucent = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
    
}
