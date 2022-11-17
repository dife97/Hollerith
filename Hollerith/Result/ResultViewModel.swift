//
//  ResultViewModel.swift
//  Hollerith
//
//  Created by Diego Ferreira on 08/11/22.
//

protocol ResultViewModelDelegate: AnyObject {
    
    func didCalculateNetSalary()
}

class ResultViewModel {
    
    var cells: Cells?
    
    weak var delegate: ResultViewModelDelegate?
    
    private let INSSDiscountRate = 0.08
    
    private var IRRFDiscountRate = 0.00
    
    private var IRRFRate = "0%"
    
    func calculateNetSalary(grossSalary: Double, discounts: Double) {
        
        let INSSDiscountValue = INSSDiscountRate * grossSalary
        
        let IRRFDiscountValue = calculateIRRF(of: grossSalary)
        
        let netSalary = grossSalary - discounts - INSSDiscountValue - IRRFDiscountValue
        
        generateCells(
            grossSalary: grossSalary,
            discounts: discounts,
            INSSDiscountValue: INSSDiscountValue,
            IRRFDiscountValue: IRRFDiscountValue,
            netSalary: netSalary
        )
    }
    
    private func generateCells(
        grossSalary: Double,
        discounts: Double,
        INSSDiscountValue: Double,
        IRRFDiscountValue: Double,
        netSalary: Double
    ) { 
        cells = [
            CellConfiguration(title: .grossSalary,
                              subtitle: nil,
                              value: grossSalary,
                              valueStyle: .positive),
            
            CellConfiguration(title: .discounts,
                              subtitle: nil,
                              value: discounts,
                              valueStyle: discounts > 0 ? .negative : .zero),
            
            CellConfiguration(title: .INSSDiscount,
                              subtitle: "8%",
                              value: INSSDiscountValue,
                              valueStyle: .negative),
            
            CellConfiguration(title: .IRRFDiscount,
                              subtitle: IRRFRate,
                              value: IRRFDiscountValue,
                              valueStyle: IRRFDiscountValue > 0 ? .negative : .zero),
            
            CellConfiguration(title: .netSalary,
                              subtitle: nil,
                              value: netSalary,
                              valueStyle: netSalary > 0 ? .positive : .zero)
        ]
        
        delegate?.didCalculateNetSalary()
    }
    
    private func calculateIRRF(of grossSalary: Double) -> Double {
        
        switch grossSalary {
            
        case let salary where salary < 1903.98:
            return 0
        
        case let salary where salary < 2826.65:
            IRRFRate = "7,5%"
            
            return grossSalary * 0.075
        
        case let salary where salary < 3751.05:
            IRRFRate = "15%"
            
            return grossSalary * 0.15
        
        case let salary where salary < 4664.68:
            IRRFRate = "22,5%"
            return grossSalary * 0.225
            
        default:
            IRRFRate = "27,5%"
            
            return grossSalary * 0.275
        }
    }
}
