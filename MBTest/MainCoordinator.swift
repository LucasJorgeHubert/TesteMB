import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func pop()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func start() {
        let vm = ListExchangesViewModel(coordinator: self)
        let vc = ListExchangesViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func ShowDetail(exchange: Exchanges) {
        let vm = ExchangeDetailViewModel(ex: exchange, coordinator: self)
        let vc = ExchangeDetailViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: false)
    }
    
}
