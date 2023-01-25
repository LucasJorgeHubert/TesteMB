import UIKit

class ExchangeDetailView: UIView {
    
    // MARK: - Scroll View
    
    var scrollView = UIScrollView()
    
    // MARK: - Labels
    var exName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exId: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exSite: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exStart: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exEnd: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exQuoteTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.text = "Quotes"
        return label
    }()
    
    var exQuoteStart: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exQuoteEnd: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exOrderBookTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.text = "OrderBook"
        return label
    }()
    
    var exOrderBookStart: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exOrderBookEnd: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exTradeTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.text = "trade"
        return label
    }()
    
    var exTradeStart: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var exTradeEnd: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var symbols: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var usd1hrs: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var usd1day: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    var usd1month: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
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
        self.addSubview(scrollView)
        [
            exName,
            exId,
            exSite,
            exStart,
            exEnd,
            exQuoteTitle,
            exQuoteStart,
            exQuoteEnd,
            exOrderBookTitle,
            exOrderBookStart,
            exOrderBookEnd,
            exTradeTitle,
            exTradeStart,
            exTradeEnd,
            symbols,
            usd1hrs,
            usd1day,
            usd1month
        ].forEach { scrollView.addSubview($0) }
    }
    
    private func setupConstraints() {
        [
            scrollView,
            exName,
            exId,
            exSite,
            exStart,
            exEnd,
            exQuoteTitle,
            exQuoteStart,
            exQuoteEnd,
            exOrderBookTitle,
            exOrderBookStart,
            exOrderBookEnd,
            exTradeTitle,
            exTradeStart,
            exTradeEnd,
            symbols,
            usd1hrs,
            usd1day,
            usd1month
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            exName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            exName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            exName.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            exId.topAnchor.constraint(equalTo: exName.bottomAnchor, constant: 16),
            exId.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            exId.trailingAnchor.constraint(equalTo: exName.trailingAnchor),
            
            exSite.topAnchor.constraint(equalTo: exId.bottomAnchor, constant: 16),
            exSite.leadingAnchor.constraint(equalTo: exId.leadingAnchor),
            exSite.trailingAnchor.constraint(equalTo: exId.trailingAnchor),
            
            exStart.topAnchor.constraint(equalTo: exSite.bottomAnchor, constant: 16),
            exStart.leadingAnchor.constraint(equalTo: exSite.leadingAnchor),
            
            exEnd.topAnchor.constraint(equalTo: exStart.bottomAnchor, constant: 16),
            exEnd.leadingAnchor.constraint(equalTo: exSite.leadingAnchor),
            
            exQuoteTitle.topAnchor.constraint(equalTo: exEnd.bottomAnchor, constant: 16),
            exQuoteTitle.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            exQuoteTitle.trailingAnchor.constraint(equalTo: exName.trailingAnchor),
            
            exQuoteStart.topAnchor.constraint(equalTo: exQuoteTitle.bottomAnchor, constant: 12),
            exQuoteStart.leadingAnchor.constraint(equalTo: exQuoteTitle.leadingAnchor, constant: 12),
            
            exQuoteEnd.topAnchor.constraint(equalTo: exQuoteStart.bottomAnchor, constant: 12),
            exQuoteEnd.leadingAnchor.constraint(equalTo: exQuoteStart.leadingAnchor),
            
            exOrderBookTitle.topAnchor.constraint(equalTo: exQuoteEnd.bottomAnchor, constant: 16),
            exOrderBookTitle.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            exOrderBookTitle.trailingAnchor.constraint(equalTo: exName.trailingAnchor),
            
            exOrderBookStart.topAnchor.constraint(equalTo: exOrderBookTitle.bottomAnchor, constant: 12),
            exOrderBookStart.leadingAnchor.constraint(equalTo: exOrderBookTitle.leadingAnchor, constant: 16),
            
            exOrderBookEnd.topAnchor.constraint(equalTo: exOrderBookStart.bottomAnchor, constant: 12),
            exOrderBookEnd.leadingAnchor.constraint(equalTo: exOrderBookStart.leadingAnchor),
            
            exTradeTitle.topAnchor.constraint(equalTo: exOrderBookEnd.bottomAnchor, constant: 16),
            exTradeTitle.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            exTradeTitle.trailingAnchor.constraint(equalTo: exName.trailingAnchor),
            
            exTradeStart.topAnchor.constraint(equalTo: exTradeTitle.bottomAnchor, constant: 12),
            exTradeStart.leadingAnchor.constraint(equalTo: exTradeTitle.leadingAnchor, constant: 12),
            
            exTradeEnd.topAnchor.constraint(equalTo: exTradeStart.bottomAnchor, constant: 12),
            exTradeEnd.leadingAnchor.constraint(equalTo: exTradeStart.leadingAnchor),

            symbols.topAnchor.constraint(equalTo: exTradeEnd.bottomAnchor, constant: 16),
            symbols.trailingAnchor.constraint(equalTo: exName.trailingAnchor),
            symbols.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            
            usd1hrs.topAnchor.constraint(equalTo: symbols.bottomAnchor, constant: 16),
            usd1hrs.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            
            usd1day.topAnchor.constraint(equalTo: usd1hrs.bottomAnchor, constant: 16),
            usd1day.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            
            usd1month.topAnchor.constraint(equalTo: usd1day.bottomAnchor, constant: 16),
            usd1month.leadingAnchor.constraint(equalTo: exName.leadingAnchor),
            usd1month.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
    }

    
}
