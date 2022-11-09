//
//  CalculatorView.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class CalculatorView: UIView {
    
    var didTapCalculateButton: (() -> Void)?
    
    var grossSalaryValue: Double {
        if grossSalaryTextField.text?.isEmpty == false {
            return Double(grossSalaryTextField.text!)!
        }
        
        return 0
    }
    
    var discountValue: Double {
        if discountsTextField.text?.isEmpty == false {
            return Double(discountsTextField.text!)!
        }
        
        return 0
    }
    
    private let stackView = CustomStackView()
    
    private let grossSalaryTextField = CustomTextField(
        placeholder: "Salário bruto",
        keyboardType: .decimalPad
    )
    
    private let discountsTextField = CustomTextField(
        placeholder: "Descontos",
        keyboardType: .decimalPad
    )
    
    private lazy var calculateButton: CustomButton = {
        let button = CustomButton(title: "CALCULAR")
        
        button.action = { self.calculateButtonTapped() }
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        configureTextFields()
        
        configureCalculateButton()
        
        additionalConfiguration()
    }
    
    private func configureTextFields() {
        
        stackView.addArrangedSubview(grossSalaryTextField)
        stackView.addArrangedSubview(discountsTextField)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 33),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func configureCalculateButton() {
        
        addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 22),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func additionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .mainBackground
    }
    
    private func calculateButtonTapped() {
        
        didTapCalculateButton?()
    }
    
    func cleanTextFields() {
        
        grossSalaryTextField.text = ""
        
        discountsTextField.text = ""
    }
}
