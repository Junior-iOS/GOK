//
//  Endpoint.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation

struct Endpoint {
    
    let path: String
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
        urlComponents.path = path
        return urlComponents.url
    }
    
    static func searchList() -> Endpoint {
        Endpoint(path: "/sandbox/products")
    }
    
}
