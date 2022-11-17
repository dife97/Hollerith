//
//  ResultViewController.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class ResultViewController: UIViewController {
    
    let grossSalary: Double
    
    let discounts: Double
    
    let resultView = ResultView()

    let resultViewModel = ResultViewModel()
    
    init(grossSalary: Double, discounts: Double) {
        self.grossSalary = grossSalary
        
        self.discounts = discounts
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = resultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()

        configureDelegates()
        
        resultViewModel.calculateNetSalary(grossSalary: grossSalary, discounts: discounts)
    }

    private func configureNavigationBar() {

        let closeButton = UIButton(type: .system)
        closeButton.setTitle("FECHAR", for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        closeButton.addTarget(self, action: #selector(didTapCloseBarButton), for: .touchUpInside)

        let closeBarButtonItem = UIBarButtonItem(customView: closeButton)

        navigationItem.leftBarButtonItem = closeBarButtonItem

        navigationController?.navigationBar.backgroundColor = .mainBackground

        navigationController?.navigationBar.tintColor = .mainBlack
    }

    private func configureDelegates() {

        resultView.configure(dataSource: self)
        
        resultViewModel.delegate = self
    }

    @objc private func didTapCloseBarButton() {

        dismiss(animated: true)
    }
}

extension ResultViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {

        return resultViewModel.cells?.count ?? 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier, for: indexPath) as? ResultTableViewCell,
              let cellConfiguration = resultViewModel.cells?[indexPath.row] else { return UITableViewCell() }

        cell.configure(with: cellConfiguration)

        return cell
    }
}

extension ResultViewController: ResultViewModelDelegate {
    
    func didCalculateNetSalary() {
        
        resultView.resultTableView.reloadData()
    }
}
