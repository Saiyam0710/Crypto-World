//
//  TopMovers.swift
//  Crypto World
//
//  Created by Target Integration on 03/09/23.
//

import SwiftUI

struct TopMovers: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Top Movers")
                .font(.headline)
        
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 15){
                ForEach(viewModel.topCoins){ coin in
                    TopMoversItemView(coin: coin)
                }
            }
            }
        }
        .padding()
    }
}

struct TopMovers_Previews: PreviewProvider {
    static var previews: some View {
        TopMovers(viewModel: HomeViewModel())
//        TopMovers()
    }
}
//                ForEach(0..<5,id:\.self){_ in
