//
//  CustomLabel.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class CustomLabel: UILabel {
    
    init(
        text: String = "-",
        font: UIFont = .setRobotoFont(weight: .bold, size: 15),
        alignment: NSTextAlignment = .right,
        textColor: UIColor = .black
    ) {
        super.init(frame: .zero)
        
        configureLabel(
            text: text,
            font: font,
            alignment: alignment,
            textColor: textColor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel(text: String,
                                font: UIFont,
                                alignment: NSTextAlignment,
                                textColor: UIColor) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.font = font
        
        textAlignment = alignment
        
        self.textColor = textColor
        
        self.text = text
    }
}
