//
//  CustomButton.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class CustomButton: UIView {
    
    private var buttonBackground: UIColor
    
    private let mainButton = UIButton(type: .system)
    
    var action: (() -> Void)?
    
    init(
        title: String,
        backgroundColor: UIColor = .mainBlue
    ) {
        self.buttonBackground = backgroundColor
        
        super.init(frame: .zero)
        
        configureView()
        
        configureButton(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    private func configureView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 8
        
        clipsToBounds = true
        
        addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.topAnchor.constraint(equalTo: topAnchor),
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureButton(title: String) {
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainButton.backgroundColor = buttonBackground
        
        mainButton.setTitleColor(.white, for: .normal)
        
        mainButton.setTitleColor(.mainGray, for: .disabled)
        
        mainButton.setTitle(title, for: .normal)
        
        mainButton.addTarget(self, action: #selector(didTapCustomButton), for: .touchUpInside)
    }
    
    func enableButton() {
        
        mainButton.isEnabled = true
        
        mainButton.backgroundColor = buttonBackground
    }
    
    func disableButton() {
        
        mainButton.isEnabled = false
        
        mainButton.backgroundColor = .systemGray4
    }
    
    @objc private func didTapCustomButton(_ sender: UIButton) {

        self.action?()
    }
}
