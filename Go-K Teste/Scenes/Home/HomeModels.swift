//
//  HomeModels.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright (c) 2020 Junior Silva. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Home {

    struct Response: Codable {
        var spotlight: [Spotlight]?
        var products: [Product]?
        var cash: Cash?
    }
    
}

struct Spotlight: Codable {
    let name: String
    let bannerURL: String
    let description: String
}

struct Product: Codable {
    let name: String
    let imageURL: String
    let description: String
}

struct Cash: Codable {
    let title: String
    let bannerURL: String
    let description: String
}

