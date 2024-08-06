//
//  AllCoinsView.swift
//  Crypto World
//
//  Created by Target Integration on 03/09/23.
//

import SwiftUI

struct AllCoinsView: View {
    @State var viewModel = HomeViewModel()
    var body: some View {
        VStack (alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding(.horizontal)
            HStack{
                Text("Coins")
                Spacer()
                Text("Prices")
                }
                .font(.caption)
                .foregroundColor(Color.gray)
                .padding(.horizontal)
                .padding(.top,4)
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 5){
                    ForEach(viewModel.coins){ coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}
struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView(viewModel: HomeViewModel())
    }
}
