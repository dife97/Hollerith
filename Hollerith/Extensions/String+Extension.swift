//
//  String+Extension.swift
//  Hollerith
//
//  Created by Diego Ferreira on 10/11/22.
//

import Foundation

extension String {

    func convertToCurrencyFormat() -> CurrencyModel {
    
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")
        
        var number: NSNumber!
        
        var amountWithPrefix = self
    
        do {
            let regex = try NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
            
            amountWithPrefix = regex.stringByReplacingMatches(
                in: amountWithPrefix,
                options: NSRegularExpression.MatchingOptions(rawValue: 0),
                range: NSMakeRange(0, self.count),
                withTemplate: ""
            )
            
            let double = (amountWithPrefix as NSString).doubleValue
            
            number = NSNumber(value: (double / 100))
            
            guard number != 0 as NSNumber else {
                return CurrencyModel(formatted: "R$ 0,00", number: 0)
            }
            
            let formattedString = numberFormatter.string(from: number)!
            
            let doubleNumber = Double(truncating: number)
        
            return CurrencyModel(formatted: formattedString, number: doubleNumber)
        } catch {
            return CurrencyModel(formatted: "", number: 0)
        }
    }
}

