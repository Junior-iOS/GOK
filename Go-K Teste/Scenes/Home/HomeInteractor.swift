//
//  HomeInteractor.swift
//  Go-K Teste
//
//  Created by Junior Silva on 07/10/20.
//  Copyright (c) 2020 Junior Silva. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import UIKit

protocol HomeBusinessLogic {
    func fetchList()
}

protocol HomeDataStore {
    
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    init(worker: HomeWorker = HomeWorker()) {
        self.worker = worker
    }
    
    func fetchList() {
        worker?.searchList().done(handleSuccess).catch(handleError)
    }
    
    private func handleSuccess(_ response: Home.Response) {
        
    }
    
    private func handleError(_ error: Error) {
        
    }
}
