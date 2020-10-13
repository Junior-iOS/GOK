//
//  HomeWorkerMock.swift
//  Go-K TesteTests
//
//  Created by Junior Silva on 12/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import PromiseKit
@testable import Go_K

enum ResultTypes {
    case success
    case error
    case empty
}

class HomeWorkerMock: HomeNetworkLogic {
    
    var resultType: ResultTypes = .success
    
    func searchList() -> Promise<Home.Response> {
        switch resultType {
        case .success:
            let helper = JSONReaderHelper()
            if let response: Home.Response = helper.read(filename: "home") {
                return Promise { seal in
                    seal.fulfill(response)
                }
            }
            
        case .error:
            return Promise { seal in
                seal.reject(NetworkError.notFound)
            }
            
        case .empty:
            let response: Home.Response = Home.Response()
            return Promise { seal in
                seal.fulfill(response)
            }
        }
        
        return Promise { seal in
            seal.reject(NetworkError.mappingError)
        }
    }
    
}
