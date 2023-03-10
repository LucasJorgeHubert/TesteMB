//
//  MBTestTests.swift
//  MBTestTests
//
//  Created by TLSP-000161 on 24/01/23.
//

import XCTest
@testable import MBTest

class MBTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_fetchExchanges() async {
        let nav = UINavigationController()
        let coord = MainCoordinator(navigationController: nav)
        let mock = MockListViewModel(coordinator: coord)
        
        do {
            let result = try await mock.fetchExchanges()
            XCTAssertNotNil(result)
            XCTAssertEqual(result.count, 3)
            XCTAssertEqual(result[0].name, "Binance")
        } catch {
            print(error)
        }
    }

}
