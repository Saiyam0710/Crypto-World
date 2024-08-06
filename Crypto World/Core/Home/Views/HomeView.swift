//
//  HomeView.swift
//  Crypto World
//
//  Created by Target Integration on 03/09/23.
//

import SwiftUI

struct HomeView: View {
    
@StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical,showsIndicators: true){
                TopMovers(viewModel: viewModel)
                Divider()
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("Crypto Live Prices")
        }
        
    }
}
// all coin view
//AllCoinsView()
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
