//
//  Float+Extension.swift
//  SpendMeter
//
//  Created by Tin on 16.08.2025..
//

import Foundation

extension Float {
    public var formattedCurrency: String {
        let currency = Locale.current.currency?.identifier ?? "EUR"
        return abs(self).formatted(.currency(code: currency))
    }

    public var formattedCurrencyWithSign: String {
        let symbol = self >= 0 ? "+" : "-"
        return symbol + self.formattedCurrency
    }
}
