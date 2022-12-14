//
//  ViewController.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class CalculatorViewController: UIViewController {

    private lazy var calculatorView: CalculatorView = {
        let view = CalculatorView()
        
        view.didTapCalculateButton = { self.didTapCalculateButton() } 
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureInitialState()
    }
    
    private func configureView() {
        
        title = "Holerite"
        
        view.backgroundColor = .white
        
        view.addSubview(calculatorView)
        
        NSLayoutConstraint.activate([
            calculatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureInitialState() {
        
        calculatorView.calculateButton.disableButton()
    }
    
    private func didTapCalculateButton() {
        
        let resultViewController = ResultViewController(grossSalary: calculatorView.grossSalaryValue,
                                                        discounts: calculatorView.discountValue)
        
        let resultNavigationController = UINavigationController(rootViewController: resultViewController)
        
        calculatorView.cleanTextFields()
        
        navigationController?.present(resultNavigationController, animated: true)
    }
}

