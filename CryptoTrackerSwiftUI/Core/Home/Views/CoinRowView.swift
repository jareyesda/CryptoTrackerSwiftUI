//
//  CoinRowView.swift
//  CryptoTrackerSwiftUI
//
//  Created by Juan Reyes on 8/24/21.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool

    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack {
            Text(String(coin.rank))
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .leading) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text(String(format: "%.2f", (coin.currentHoldings ?? 0)) + "%")
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(String(format: "%.2f", coin.priceChangePercentage24H))
                .foregroundColor(
                    coin.priceChangePercentage24H >= 0 ?
                        Color.theme.green :
                        Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
    }
    
}
