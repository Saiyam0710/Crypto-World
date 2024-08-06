//
//  CoinRowView.swift
//  Crypto World
//
//  Created by Target Integration on 03/09/23.
//

import SwiftUI
import Kingfisher
struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack{
            
            //market cap rank
            Text("\(coin.marketCapRank )")
//            Text("1")
                .font(.caption)
                .foregroundColor(Color.gray)
            
            
            //image
            
//            Image(systemName: "bitcoinsign.circle.fill")
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32,height: 32)
                .foregroundColor(Color.orange)
               
            
            //coin name info
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
//                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                
                Text(coin.symbol.uppercased())
//                Text("BTC")
                    .font(.caption)
                    .padding(.leading,6)
            }
            .padding(.leading,2)
            
            Spacer()
            //coin price info
            
            VStack(alignment: .trailing, spacing: 4){
                Text(coin.currentPrice.toCurrency())
//                Text("123")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                
                Text(coin.priceChangePercentage24H.toPercentString())
//                Text("+4.56%")
                    .font(.caption)
                    .padding(.leading,6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading,2)
        }.padding(.horizontal)
        .padding(.vertical,4)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView( )
//    }
//}
