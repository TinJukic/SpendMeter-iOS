//
//  HomeView.swift
//  SpendMeter
//
//  Created by Tin on 13.08.2025..
//

import SwiftUI

public struct HomeView: View {
    @State private var balance: Float = 15000.00

    public var body: some View {
        NavigationStack {
            rootView
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add") {
                            print("Toolbar Add button tapped")
                        }
                        .foregroundStyle(.textPrimaryInverted)
                    }
                }
        }
    }
}

// MARK: - Helper views

extension HomeView {
    var rootView: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    currentBalanceView

                    HStack {
                        createButton(ofType: .init(title: "Add Income", color: .mainAppGreen, image: .init(systemName: "plus")), maxWidth: proxy.size.width / 2) {
                            print("Add Income tapped")
                        }
                        Spacer()
                        createButton(ofType: .init(title: "Make Payment", color: .warning, image: .init(systemName: "minus")), maxWidth: proxy.size.width / 2) {
                            print("Make Payment tapped")
                        }
                    }

                    Text("Recent Transactions")
                        .font(.title)
                        .foregroundStyle(.textPrimaryInverted)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .leading)

                    Spacer()
                }
                .padding(.top, 24)
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, minHeight: proxy.size.height)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .background(Color.background)
    }

    var currentBalanceView: some View {
        VStack(spacing: 12) {
            Text(balance, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                .font(.balance)
            Text("Current balance")
                .font(.sectionTitle)
        }
        .foregroundStyle(.textPrimary)
        .padding(.vertical, 48)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundStyle(balance > 0 ? .mainAppGreen : .warning)
        }
    }

    func createButton(ofType button: SpendingButtonType, maxWidth: CGFloat, onTap: @escaping () -> Void) -> some View {
        Button(action: onTap) {
            VStack(spacing: 16) {
                button.image
                    .font(.title)
                    .foregroundStyle(.textPrimary)
                    .frame(width: 50, height: 50)
                    .background {
                        Circle()
                            .foregroundStyle(button.color)
                    }
                
                Text(button.title)
                    .font(.button)
                    .foregroundStyle(.textPrimaryInverted)
                    .lineLimit(1)
            }
            .padding(.vertical, 16)
            .frame(maxWidth: maxWidth)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.container)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}
