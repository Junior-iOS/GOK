//
//  HomePresenterMock.swift
//  Go-K TesteTests
//
//  Created by Junior Silva on 12/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
@testable import Go_K

class HomePresenterMock: HomePresentationLogic {
    
    var presentReloadTableViewCount = 0
    var presentStopsActivityIndicatorCount = 0
    var presentEmptyStateCount = 0
    var presentSelectedSpotlightCount = 0
    var presentSelectedCashCount = 0
    var presentSelectedProductCount = 0
    
    func reloadTableView() {
        presentReloadTableViewCount += 1
    }
    
    func stopsActivityIndicator() {
        presentStopsActivityIndicatorCount += 1
    }
    
    func presentEmptyState() {
        presentEmptyStateCount += 1
    }
    
    func presentSelectedSpotlight() {
        presentSelectedSpotlightCount += 1
    }
    
    func presentSelectedCash() {
        presentSelectedCashCount += 1
    }

    func presentSelectedProduct() {
        presentSelectedProductCount += 1
    }
    
}
