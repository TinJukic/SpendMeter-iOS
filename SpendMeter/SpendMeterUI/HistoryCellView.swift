//
//  HistoryCellView.swift
//  SpendMeter
//
//  Created by Tin on 16.08.2025..
//

import Foundation
import SwiftUI

public struct HistoryCellView: View {
    private var data: Transaction

    public init(data: Transaction) {
        self.data = data
    }

    public var body: some View {
        HStack {
            image
            Text(data.description)
                .padding(6)
                .foregroundStyle(.textPrimaryInverted)
                .font(.historyCellDescription)
            Spacer()
            Text(data.amount.formattedCurrencyWithSign)
                .font(.historyCellAmount)
                .foregroundStyle(data.isPositive ? .mainAppGreen : .warning)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.container)
        }
    }

    private var image: some View {
        Group {
            if data.isPositive {
                Image(systemName: "plus")
            } else {
                Image(systemName: "minus")
            }
        }
        .font(.title)
        .foregroundStyle(.textPrimary)
        .frame(width: 50, height: 50)
        .background {
            Circle()
                .foregroundStyle(data.isPositive ? .mainAppGreen : .warning)
        }
    }
}

#Preview {
    HistoryCellView(data: .mocked)
}
