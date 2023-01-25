//
//  ExchangeDetailViewControllerTests.swift
//  MBTestTests
//
//  Created by TLSP-000161 on 25/01/23.
//

import XCTest
@testable import MBTest

class ExchangeDetailViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_formatDate() async {
        let nav = UINavigationController()
        let coord = MainCoordinator(navigationController: nav)
        let mock = MockListViewModel(coordinator: coord)
        
        do {
            let result = try await mock.fetchExchanges()
            let vm = ExchangeDetailViewModel(ex: result[0], coordinator: coord)
            let vc = await ExchangeDetailViewController(viewModel: vm)
            
            let currency = await vc.formatCurrency(12.80, "Vol. 1 month")
            XCTAssertEqual(currency, "Vol. 1 month: $12.80")
        } catch {
            print(error)
        }
    }

}
