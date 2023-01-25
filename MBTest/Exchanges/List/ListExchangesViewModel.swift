import Foundation

public class ListExchangesViewModel {
    
    let coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchExchanges() async throws -> ([Exchanges]) {
        let id = String(UserDefaults.standard.string(forKey: "appKey") ?? "")
        var request = URLRequest(url: URL(string: "https://rest.coinapi.io/v1/exchanges")!)
        request.allHTTPHeaderFields = ["X-CoinAPI-Key": id]
        
        request.httpMethod = "GET"
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        continuation.resume(with: .failure(error!))
                    } else if let data = data {
                        do {
                            let list: [Exchanges] = try JSONDecoder().decode([Exchanges].self, from: data)
                            continuation.resume(with: .success(list))
                        } catch {
                            print(String(describing: error))
                            continuation.resume(with: .failure(error))
                        }
                    }
                }
            }.resume()
        }
    }
}
