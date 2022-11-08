//
//  ResultViewController.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class ResultViewController: UIViewController {
    
    let resultView = ResultView()
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        
        configureDelegates()
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
        
        resultView.configure(delegate: self,dataSource: self)
    }
    
    @objc private func didTapCloseBarButton() {
        
        dismiss(animated: true)
    }
}

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.identifier,
                                                       for: indexPath) as? ResultTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: "Diego Lindo")
        
        return cell
    }
}

extension ResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("DIEGO LINDO")
    }
}
