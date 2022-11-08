//
//  ViewController.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    let calculatorView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
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
}

