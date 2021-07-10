//
//  APICallListUI.swift
//  TeslaStockApp
//
//  Created by Nate Lee on 7/3/21.
//

import SwiftUI

let getUrl = "https://financialmodelingprep.com/api/v3/quote/TSLA?apikey=31db252d10590d2b83cbc274bd6d027d"

struct GlobalQuote: Decodable {
 
    var symbol: String
    var name: String
    var price: Double
    var changesPercentage: Double
    var change: Double
    var dayLow: Double
    var dayHigh: Double
    var yearHigh: Double
    var yearLow: Double
    var marketCap: Double
    var volume: Int
    
   

}

class ViewModel: ObservableObject {
    @Published var items = [GlobalQuote]()
    
    func loadData() {
        guard let url = URL(string: getUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, res, err in
            do {
                if let data = data {
                    
                    let result = try JSONDecoder().decode([GlobalQuote].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.items = result
                    }
                    
                } else {
                    print("No Data")
                }
            } catch (let error) {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}


struct APICallListUI: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                NavigationLink(
                    destination: TeslaHistoryView(),
                    label: {
                        Image("Tesla").resizable().frame(width: 155, height: 155, alignment: .center).padding(.all)
                    })
                
                
                
                List(viewModel.items, id: \.volume) { item in
                    VStack {
                    Text("Price: $\(item.price)")
                        .font(.title)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.977, brightness: 0.529))
                        .bold()
                        .padding(.all)
                    Text("Volume: \(item.volume)")
                        .font(.title)
                        .bold()
                        .padding(.all)
                    Text("Change: $\(item.change)")
                        .font(.title)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.977, brightness: 0.529))
                        .bold()
                        .padding(.all)
                        Text("Low: $\(item.dayLow)")
                            .font(.title)
                            .bold()
                            .padding(.all)
                        Text("High: $\(item.dayHigh)")
                            .font(.title)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.977, brightness: 0.529))
                            .bold()
                            .padding(.all)
                        Text("Change: %\(item.changesPercentage)")
                            .font(.title)
                            .bold()
                            .padding(.all)
                    Text("Symbol: \(item.symbol)")
                        .font(.title)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.977, brightness: 0.529))
                        .bold()
                        .padding(.all)
                }
            }
           
        }.onAppear(perform: {
            viewModel.loadData()
            
        })
        
        
            .navigationBarTitle("Tesla Stock Metrics")
     
    }
    
}

struct APICallListUI_Previews: PreviewProvider {
    static var previews: some View {
        APICallListUI()
    }
}
}
