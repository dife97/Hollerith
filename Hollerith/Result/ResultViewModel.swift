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
    
    private let IRRFDiscountRate = 0.00
    
    func calculateNetSalary(grossSalary: Double, discounts: Double) {
        
        let INSSDiscountValue = INSSDiscountRate * grossSalary
        
        let IRRFDiscountValue = IRRFDiscountRate * grossSalary
        
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
                              valueStyle: discounts > 0 ? .positive : .zero),
            
            CellConfiguration(title: .INSSDiscount,
                              subtitle: "8%",
                              value: INSSDiscountValue,
                              valueStyle: .negative),
            
            CellConfiguration(title: .IRRFDiscount,
                              subtitle: "0%",
                              value: IRRFDiscountValue,
                              valueStyle: IRRFDiscountValue > 0 ? .negative : .zero),
            
            CellConfiguration(title: .netSalary,
                              subtitle: nil,
                              value: netSalary,
                              valueStyle: netSalary > 0 ? .positive : .zero)
        ]
        
        delegate?.didCalculateNetSalary()
    }
}
