//
//  Balance.swift
//  SpendMeter
//
//  Created by Tin on 16.08.2025..
//

import Foundation

public struct Balance: Equatable, Codable {
    public let amount: Float
}

extension Balance {
    public var isPositive: Bool {
        return amount > 0
    }
}
