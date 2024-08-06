//
//  HomeViewModel.swift
//  Crypto World
//
//  Created by Target Integration on 03/09/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  
   
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    
    init() {
        fetchCoinData()
    }
//    API from coingecko.com
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=true&price_change_percentage=24h"
        // running the api
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data = data else { return }
//            let dataString = String(data:data, encoding: .utf8)
//            print("DEBUG: Data \(dataString)")
//
            // decoding the data from json output
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
//                print("DEBUG: Coins: \(coins)")
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMoving()
                }
              
            } catch let error{
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }.resume()
    }
    
    func configureTopMoving() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topCoins = Array(topMovers.prefix(5))
    }
}
 
