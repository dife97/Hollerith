//
//  ResultTableViewCell.swift
//  Hollerith
//
//  Created by Diego Ferreira on 07/11/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    static let identifier = "ResultTableViewCell"
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        
        contentView.addSubview(myLabel)
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: topAnchor),
            myLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            myLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            myLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with title: String) {
        
        myLabel.text = title
    }
}
