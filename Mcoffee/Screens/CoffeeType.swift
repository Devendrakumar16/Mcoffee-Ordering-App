//
//  Coffee_type.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 26/05/26.
//

import SwiftUI

struct CoffeeType:View {
    @EnvironmentObject private var orderManager: OrderManager

    var body: some View {
        
        let CoffeeType = ["Santos", "bourbon santos", "Minas", "Rio", "Canilon", "Flat beat"]
        
        VStack{
            HeaderView(title: "Select Country")
            ListHeader(title: "Select a sort of coffee")
            
            List(CoffeeType, id: \.self){type in
                NavigationLink{
                    Additives()
                        .navigationBarBackButtonHidden()
                    
                } label: {
                    VStack{
                        Text(type)
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    orderManager.updateCoffeeSort(type)
                })
                
            }
            .listStyle(.plain)
         
        }
    }
}
#Preview {
    CoffeeType()
        .environmentObject(OrderManager())
}
