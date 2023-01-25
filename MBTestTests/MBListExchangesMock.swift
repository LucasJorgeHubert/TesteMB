import Foundation
@testable import MBTest

class MockListViewModel: ListExchangesViewModel {
    override func fetchExchanges() async throws -> ([Exchanges]) {
        if let url = Bundle.main.path(forResource: "ListExchangesResponseMock", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: url), options: .alwaysMapped)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Exchanges].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}
