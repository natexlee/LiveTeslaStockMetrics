//
//  TeslaHistoryView.swift
//  TeslaStockApp
//
//  Created by Nate Lee on 7/7/21.
//

import SwiftUI

struct TeslaHistoryView: View {
    var body: some View {
      
        VStack {
            Image("Model3").resizable().frame(width: 375, height: 150, alignment: .center)
            Text("Tesla, Inc is an electric vehicle and clean energy company founded in 2003. The company's focus is accelerating the world's transition to sustainable energy. Backed by the belief that the sooner this transition happens, the better. Tesla is leading this transition through the production of their all electric vehicle lineup, and their sustainable energy ecosystem. Tesla is also expected to release new vehicles such as the Cybertruck and next-gen Roadster.").font(.title2).bold().padding()
            Spacer()
           
            
            
        }.frame(minWidth: 0/*@END_MENU_TOKEN@*/, idealWidth: 100/*@END_MENU_TOKEN@*/, maxWidth: .infinity/*@END_MENU_TOKEN@*/, minHeight: 0, idealHeight: /*@START_MENU_TOKEN@*/100, maxHeight: /*@START_MENU_TOKEN@*/.infinity, alignment: /*@START_MENU_TOKEN@*/.center)
    
    }
        
}




















struct TeslaHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TeslaHistoryView()
    }
}
