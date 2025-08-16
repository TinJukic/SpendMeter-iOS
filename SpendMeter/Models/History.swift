//
//  History.swift
//  SpendMeter
//
//  Created by Tin on 16.08.2025..
//

import Foundation

public struct History: Equatable, Codable {
    public var transactions: [Transaction]

    public init() {
        self.transactions = []
    }

    public init(transactions: [Transaction]) {
        self.transactions = transactions
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transactions = try container.decode([Transaction].self, forKey: .transactions)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transactions, forKey: .transactions)
    }
    
    enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
    }
}

// MARK: - Helpers

extension History {
    public static var mocked = History(transactions: [
        Transaction(date: Date(), amount: 100, type: .salary),
        Transaction(date: Date().addingTimeInterval(-100), amount: -200, type: .entertainment),
        Transaction(date: Date().addingTimeInterval(-200), amount: -300, type: .groceries),
        Transaction(date: Date().addingTimeInterval(-300), amount: -400, type: .other(description: "Some expense")),
    ])
}
