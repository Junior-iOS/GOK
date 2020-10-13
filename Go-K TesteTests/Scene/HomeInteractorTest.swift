//
//  HomeInteractorTest.swift
//  Go-K TesteTests
//
//  Created by Junior Silva on 12/10/20.
//  Copyright © 2020 Junior Silva. All rights reserved.
//

import Foundation
import XCTest
import Quick
import PromiseKit
@testable import Go_K

class HomeInteractorTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("HomeInteractorTest") {
            var sut: HomeInteractor!
            var mockPresenter: HomePresenterMock!
            var mockWorker: HomeWorkerMock!
            
            let response = Home.Response()
            var spotlights = response.spotlight
            var cash = response.cash
            var products = response.products
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockPresenter = HomePresenterMock()
                mockWorker = HomeWorkerMock()
                
                sut = HomeInteractor(worker: mockWorker)
                sut.presenter = mockPresenter
            }
            
            describe("fetching and population a list by making a request") {
                
                context("Request success") {
                    it("Existing home content") {
                        mockWorker.resultType = .success
                        sut.spotlights = spotlights
                        sut.cash = cash
                        sut.products = products
                        sut.fetchList()
                        
                        //expect(mockPresenter.presentStopsActivityIndicatorCount).to(equal(1))
                        //expect(mockPresenter.presentReloadTableViewCount).to(equal(1))
                    }
                    
                    it("Empty home content") {
                        mockWorker.resultType = .empty
                        sut.spotlights = nil
                        sut.cash = nil
                        sut.products = nil
                        sut.fetchList()

                        //expect(mockPresenter.presentEmptyStateCount).to(equal(1))
                    }
                }
                
            }
            
            afterEach {
                sut = nil
                mockWorker = nil
                mockPresenter = nil
            }
        }
    }
    
}
