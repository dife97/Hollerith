//
//  CalculatorView.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

final class CalculatorView: UIView {
    
    var salaryModel: CurrencyModel?
    
    var discountModel: CurrencyModel?
    
    var didTapCalculateButton: (() -> Void)?
    
    var grossSalaryValue: Double {
        if let salaryNumber = salaryModel?.number, grossSalaryTextField.text?.isEmpty == false {
            return salaryNumber
        }
        
        return 0
    }
    
    var discountValue: Double {
        if let discountNumber = discountModel?.number, discountsTextField.text?.isEmpty == false {
            return discountNumber
        }
        
        return 0
    }
    
    private let stackView = CustomStackView()
    
    private lazy var grossSalaryTextField: CustomTextField = {
        let textField = CustomTextField(
            placeholder: "Salário bruto",
            keyboardType: .decimalPad
        )
        
        textField.didChangeSelection = { [unowned self] in

            self.applyCurrencyMask(to: textField)
        }
        
        return textField
    }()
    
    private lazy var discountsTextField: CustomTextField = {
        let textField = CustomTextField(
            placeholder: "Descontos",
            keyboardType: .decimalPad
        )
        
        textField.didChangeSelection = { [unowned self] in
            
            self.applyCurrencyMask(to: textField)
        }
        
        return textField
    }()
    
    lazy var calculateButton: CustomButton = {
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
        grossSalaryTextField.resignFirstResponder()
        
        discountsTextField.text = ""
        discountsTextField.resignFirstResponder()
    }
    
    private func applyCurrencyMask(to textField: UITextField) {
        
        if let currencyValue = textField.text?.convertToCurrencyFormat() {
            
            if textField == grossSalaryTextField {
                salaryModel = currencyValue
            }
            
            if textField == discountsTextField {
                discountModel = currencyValue
            }
            
            textField.text = currencyValue.formatted
        }
        
        checkToEnableCalculateButton()
    }
    
    private func checkToEnableCalculateButton() {
        
        if grossSalaryValue > 0 && discountValue >= 0 {
            calculateButton.enableButton()
        } else {
            calculateButton.disableButton()
        }
    }
}

