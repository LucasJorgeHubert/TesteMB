import UIKit

class ListExchangesTableViewCell: UITableViewCell {
    
    private let cellView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray5
        v.layer.cornerRadius = 8
        v.layer.shadowOffset = CGSize(width: 1, height: 1)
        v.layer.shadowColor = UIColor.systemGray6.cgColor
        return v
    }()
    
    private let nameLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        return l
    }()
    
    private var idLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    private var volume1DayUSDLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.font = .systemFont(ofSize: 14, weight: .light)
        return l
    }()

    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: Custom methods
    func setup(ex: Exchanges) {
        self.nameLabel.text = ex.name
        self.idLabel.text = ex.exchangeID
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: NSNumber.init(value: ex.volume1DayUsd ?? 0.0)) {
            volume1DayUSDLabel.text = "Vol. 1 Day: \(formattedTipAmount)"
        }
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        [
            cellView,
            nameLabel,
            idLabel,
            volume1DayUSDLabel].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        [
            cellView,
            nameLabel,
            idLabel,
            volume1DayUSDLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            idLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            idLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16),
            
            volume1DayUSDLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            volume1DayUSDLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16)
        ])
    }

}
