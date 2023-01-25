//
//  ExchangeDetailViewModel.swift
//  MBTest
//
//  Created by TLSP-000161 on 25/01/23.
//

import Foundation

class ExchangeDetailViewModel {
    
    var exchange: Exchanges?
    let coordinator: MainCoordinator?
    
    init(ex: Exchanges, coordinator: MainCoordinator) {
        self.exchange = ex
        self.coordinator = coordinator
    }
}
