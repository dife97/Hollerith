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
//        fontSize: CGFloat = 15,
//        fontWeight: UIFont.Weight = .bold,
        font: UIFont = .setRobotoFont(weight: .bold, size: 15),
        alignment: NSTextAlignment = .right,
        textColor: UIColor = .black
    ) {
        super.init(frame: .zero)
        
        configureLabel(
            text: text,
//            fontSize: fontSize,
//            fontWeight: fontWeight,
            font: font,
            alignment: alignment,
            textColor: textColor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel(text: String,
//                                fontSize: CGFloat,
//                                fontWeight: UIFont.Weight,
                                font: UIFont,
                                alignment: NSTextAlignment,
                                textColor: UIColor) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
//        font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.font = font
        
        textAlignment = alignment
        
        self.textColor = textColor
        
        self.text = text
    }
}
