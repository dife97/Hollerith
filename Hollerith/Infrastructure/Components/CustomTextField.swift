//
//  CustomTextField.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class CustomTextField: UITextField {
    
    var didChangeSelection: (() -> Void)?
    
    private let insets = UIEdgeInsets(
        top: 11,
        left: 11,
        bottom: 9,
        right: 11
    )
    
    init(
        placeholder: String = "",
        keyboardType: UIKeyboardType = .default
    ) { 
        super.init(frame: .zero)
        
        configureTextField(
            placeholder: placeholder,
            keyboardType: keyboardType
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 32, height: 44)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    private func configureTextField(placeholder: String,
                                    keyboardType: UIKeyboardType) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.delegate = self
        
        self.placeholder = placeholder
        
        self.keyboardType = keyboardType
        
        self.font = .setRobotoFont(weight: .regular, size: 16)
        
        layer.borderColor = UIColor.borderColor.cgColor
        
        layer.borderWidth = 1
        
        layer.cornerRadius = 8
        
        clipsToBounds = true
        
        backgroundColor = .white
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        didChangeSelection?()
    }
}
