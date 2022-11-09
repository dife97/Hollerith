//
//  ResultModel.swift
//  Hollerith
//
//  Created by Diego Ferreira on 08/11/22.
//

struct CellConfiguration {
    
    let title: CellTitles
    let subtitle: String?
    let value: Double
    let valueStyle: ValueStyle
}

typealias Cells = [CellConfiguration]

enum ValueStyle {
    
    case positive
    case negative
    case zero
}

enum CellTitles: String {
    
    case grossSalary = "Salário Bruto"
    case discounts = "Descontos"
    case INSSDiscount = "Desconto INSS"
    case IRRFDiscount = "Desconto IRRF"
    case netSalary = "Salário Líquido"
}
