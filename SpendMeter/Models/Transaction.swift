//
//  Transaction.swift
//  SpendMeter
//
//  Created by Tin on 16.08.2025..
//

import Foundation

public struct Transaction: Equatable, Codable, Identifiable {
    public var id = UUID()

    public let date: Date
    public let amount: Float
    public let type: TransactionType

    public enum TransactionType: Equatable, Codable {
        case salary, groceries, transportation, entertainment
        case other(description: String)
    }
}

// MARK: Helpers

extension Transaction {
    public var isPositive: Bool {
        return amount >= 0
    }

    public var description: String {
        switch type {
        case .entertainment:
            return "Entertainment"
        case .groceries:
            return "Groceries"
        case .salary:
            return "Salary"
        case .transportation:
            return "Transportation"
        case .other(description: let description):
            return description
        }
    }
}

extension Transaction {
    public static var mocked = Transaction(date: Date(), amount: 1000.0, type: .entertainment)
}
