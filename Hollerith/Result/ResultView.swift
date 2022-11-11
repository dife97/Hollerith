//
//  ResultView.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class ResultView: UIView {
    
    lazy var resultTableView: UITableView = {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 60
        tableView.allowsSelection = false
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
            resultTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            resultTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            resultTableView.heightAnchor.constraint(equalToConstant: 5 * 60)
        ])
    }

    private func additionalConfiguration() {

        backgroundColor = .mainBackground
    }

    func configure(dataSource: UITableViewDataSource) {

        resultTableView.dataSource = dataSource
    }
}
