//
//  TopMoversItemView.swift
//  Crypto World
//
//  Created by Target Integration on 03/09/23.
//

import SwiftUI
import Kingfisher
struct TopMoversItemView: View {
    let coin:Coin
    var body: some View {
        VStack(alignment: .leading,spacing: 2){
            //image
//            Image(systemName: "bitcoinsign.circle.fill")
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32)
                .foregroundColor(Color.orange)
                .padding(.bottom,8)
            
            // coin info
            
            HStack(spacing: 2){
                Text(coin.symbol.uppercased())
//                Text("BTC")
                    .font(.caption)
                    .bold()
                
                Text(coin.currentPrice.toCurrency())
//                Text("123")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            
//             coin percent change
            Text(coin.priceChangePercentage24H.toPercentString())
//            Text("+ 4.56%")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140,height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4),lineWidth: 2)
        )
    }
}
//
//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
