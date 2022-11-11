//
//  CustomStackView.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class CustomStackView: UIStackView {
    
    init(
        axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = 12
    ) { 
        super.init(frame: .zero)
        
        self.axis = axis
        
        self.spacing = spacing
        
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
