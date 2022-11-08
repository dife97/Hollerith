//
//  ResultView.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class ResultView: UIView {
    
    private lazy var resultTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.identifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureResultTableView()
        
        additionalConfiguration()
    }
    
    private func configureResultTableView() {
        
        resultTableView.backgroundColor = .white
        
        addSubview(resultTableView)
        
        NSLayoutConstraint.activate([
            resultTableView.topAnchor.constraint(equalTo: topAnchor),
            resultTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            resultTableView.heightAnchor.constraint(equalToConstant: 550)
        ])
    }
    
    private func additionalConfiguration() {
        
        backgroundColor = .mainBackground
    }
    
    func configure(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        
        resultTableView.delegate = delegate
        
        resultTableView.dataSource = dataSource
    }
}
