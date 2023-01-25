import UIKit

class ListExchangesViewController: UIViewController {
    
    private let viewModel: ListExchangesViewModel
    
    private let mainView = ListExchangesView()
    private var exchanges = [Exchanges]()
    
    init(viewModel: ListExchangesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Exchanges CoinAPI.io"
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTableAction))
        ]
        
        setupTableView()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTableData()
    }
    
    @objc func refreshTableAction() {
        self.setupTableData()
    }
    
    private func setupTableView() {
        mainView.exchangesTable.dataSource = self
        mainView.exchangesTable.delegate = self
        mainView.exchangesTable.register(ListExchangesTableViewCell.self, forCellReuseIdentifier: "ListExchangesTableViewCell")
    }
    
    private func setupTableData() {
        self.showSpinner(onView: self.mainView)
        Task.init {
            do {
                exchanges = try await self.viewModel.fetchExchanges()
                self.mainView.exchangesTable.reloadData()
                self.removeSpinner()

            } catch {
                self.removeSpinner()
                self.showToast(
                    text: "Erro ao carregar as exchanges da coinAPI.io, tente novamente mais tarde",
                    type: .error,
                    onView: self.mainView
                )
            }
        }
    }
}


extension ListExchangesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.exchanges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListExchangesTableViewCell", for: indexPath) as! ListExchangesTableViewCell
        cell.setup(ex: self.exchanges[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exchange = self.exchanges[indexPath.row]
        
        self.viewModel.coordinator?.ShowDetail(exchange: exchange)
    }
    
}
