import UIKit

class ListExchangesView: UIView {
    
    var exchangesTable: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.selectionFollowsFocus = false
        return tv
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(exchangesTable)
    }
    
    private func setupConstraints() {
        exchangesTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            exchangesTable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            exchangesTable.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            exchangesTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            exchangesTable.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
