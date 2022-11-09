//
//  ResultTableViewCell.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    static let identifier = "ResultTableViewCell"
    
    private var hasSubtitle = false

    private lazy var titleLabel = CustomLabel()

    private lazy var valueLabel = CustomLabel()

    private lazy var subtitleLabel = CustomLabel(
        fontWeight: .regular,
        textColor: .mainGray
    )
    
    private func configureCell() {
        
        if hasSubtitle {
            configureTitleAndSubtitleLabels()
        } else {
            configureTitleLabel()
        }
        
        configureValueLabel()
    }
    
    private func configureTitleLabel() {
        
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    private func configureValueLabel() {
        
        contentView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func configureTitleAndSubtitleLabels() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
    
    func configure(with cell: CellConfiguration) {
        titleLabel.text = cell.title.rawValue
        
        valueLabel.text = "R$ \(cell.value)"
        
        configureValueWith(cell.valueStyle)
        
        if let subtitle = cell.subtitle {
            subtitleLabel.text = subtitle
            
            hasSubtitle = true
        }
        
        configureCell()
    }
    
    private func configureValueWith(_ style: ValueStyle) {
        
        switch style {
        
        case .positive:
            valueLabel.textColor = .mainGreen
            
        case .negative:
            valueLabel.textColor = .mainRed
            
        case .zero:
            valueLabel.textColor = .mainGray
            
        }
    }
}
