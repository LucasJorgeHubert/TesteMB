//
//  ExchangeDetailViewController.swift
//  MBTest
//
//  Created by TLSP-000161 on 25/01/23.
//

import UIKit

class ExchangeDetailViewController: UIViewController {

    private let viewModel: ExchangeDetailViewModel
    
    private let mainView = ExchangeDetailView()
    
    init(viewModel: ExchangeDetailViewModel) {
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
        self.navigationItem.title = viewModel.exchange?.name ?? ""
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupLabels()
    }
    
    func setupLabels() {
        mainView.exName.text = "Exchange name: \(viewModel.exchange?.name ?? "")"
        mainView.exId.text = "Exchange id: \(viewModel.exchange?.exchangeID ?? "")"
        mainView.exSite.text = "Website: \(viewModel.exchange?.website ?? "")"
        mainView.exStart.text = "Start in: \(viewModel.exchange?.dataStart ?? "")"
        mainView.exEnd.text = "End in: \(viewModel.exchange?.dataEnd ?? "")"
        mainView.exQuoteStart.text = formatDate(viewModel.exchange?.dataQuoteStart ?? "", true)
        mainView.exQuoteEnd.text = formatDate(viewModel.exchange?.dataQuoteEnd ?? "", false)
        mainView.exOrderBookStart.text = formatDate(viewModel.exchange?.dataOrderbookStart ?? "", true)
        mainView.exOrderBookEnd.text = formatDate(viewModel.exchange?.dataOrderbookEnd ?? "", false)
        mainView.exTradeStart.text = formatDate(viewModel.exchange?.dataTradeStart ?? "", true)
        mainView.exTradeEnd.text = formatDate(viewModel.exchange?.dataTradeEnd ?? "", false)
        mainView.symbols.text = "Symbols: \(viewModel.exchange?.dataSymbolsCount ?? 0)"
        mainView.usd1month.text = formatCurrency(viewModel.exchange?.volume1MthUsd ?? 0.0, "Vol. 1 Month")
        mainView.usd1day.text = formatCurrency(viewModel.exchange?.volume1DayUsd ?? 0.0, "Vol. 1 Day")
        mainView.usd1hrs.text = formatCurrency(viewModel.exchange?.volume1HrsUsd ?? 0.0, "Vol. 1 Hrs")
    }
    
    func formatDate(_ exDate: String,_ start: Bool) -> String {
        var date: Date
        
        let dateFormatterInput = DateFormatter()
        let dateFormatterOutput = DateFormatter()
        
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        dateFormatterInput.locale = Locale(identifier: "en_US")
        
        date = dateFormatterInput.date(from: exDate) ?? Date()
        
        dateFormatterOutput.locale = Locale(identifier: "pt_BR")
        dateFormatterOutput.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm")
        return "\(start ? "Start in" : "End in"): \(dateFormatterOutput.string(from: date))"
    }
    
    func formatCurrency(_ exValue: Double, _ exRange: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: NSNumber.init(value: exValue)) {
            return "\(exRange): \(formattedTipAmount)"
        }
        return ""
    }

}
