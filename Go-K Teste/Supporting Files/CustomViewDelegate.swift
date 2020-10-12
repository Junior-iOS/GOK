//
//  CustomViewDelegate.swift
//  Go-K Teste
//
//  Created by Junior Silva on 11/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation

protocol CustomViewDelegate {
    func setupViews()
    func setupConstraints()
    func setupConfigurations()
}

extension CustomViewDelegate {
    func setupItAllUp() {
        setupViews()
        setupConstraints()
        setupConfigurations()
    }
}
