//
//  OrderOptions.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//

import SwiftUI

struct OrderOptions:View {
    
    @State private var isOn = true
    @State private var quantity:Int = 1
    @State private var ristrettoOption = 1
    @State private var onsiteNTakeaway = 1
    @State private var volume = 1
    @State private var showBarista = false
    
    let coffee: Coffee
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var orderManager: OrderManager
    
    var body: some View {
       
        VStack{
            
                
          HeaderView(title: "Order")
            ScrollView{
                VStack{
                    VStack{
                        Image(coffee.image)
                        
                            .resizable()
                            .scaledToFit()
                            .frame(width: 152, height: 170)
                        //.background(.gray)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding(25)
                    
                    VStack{
                        HStack{
                            
                            Text("\(coffee.name)")
                            Spacer()
                            
                            HStack(spacing: 16){
                                Button("-"){
                                    if quantity > 1{
                                        quantity -= 1
                                    }
                                    
                                }
                                .padding(.horizontal, 5)
                                .foregroundStyle(.black)
                                
                                Text("\(quantity)")
                                //.padding(.horizontal, 2)
                                
                                Button("+"){
                                    quantity += 1
                                    
                                }
                                .padding(.horizontal, 5)
                                .foregroundStyle(.black)
                                
                            }
                            .padding(5)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                            )
                        }
                        .padding(.leading, 35)
                        .padding(.trailing, 45)
                        
                        Divider()
                            .padding(.horizontal, 32)
                            .padding(.top)
                        
                        HStack{
                            Text("Ristretto")
                            
                            Spacer()
                            
                            Button("One"){
                                ristrettoOption = 1
                                
                            }
                            .padding(.horizontal, 24)
                            .padding(5)
                            .foregroundStyle(ristrettoOption == 1 ? .white : .black)
                            .background(ristrettoOption == 1 ? .black : .white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                            )
                            Button("Two"){
                                ristrettoOption = 2
                                
                            }
                            .padding(.horizontal, 24)
                            .padding(5)
                            .foregroundStyle(ristrettoOption == 2 ? .white : .black)
                            .background(ristrettoOption == 2 ? .black : .white)
                            .cornerRadius(15)
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.7), lineWidth: 1)
                            )
                        }
                        .padding(.top)
                        .padding(.leading, 35)
                        .padding(.trailing, 45)
                        
                        Divider()
                            .padding(.horizontal, 32)
                            .padding(.top)
                        
                        HStack{
                            Text("Onsite/Takeaway")
                            Spacer()
                            HStack(spacing: 15){
                                Button{
                                    onsiteNTakeaway = 1
                                }label: {
                                    Image(systemName: onsiteNTakeaway == 1 ? "cup.and.saucer.fill" : "cup.and.saucer")
                                        .font(.largeTitle)
                                        .foregroundStyle(.black)
                                    // .background(onsiteNTakeaway == 1 ? .black : .white)
                                }
                                
                                Button{
                                    onsiteNTakeaway = 2
                                    
                                }label: {
                                    Image(systemName: onsiteNTakeaway == 2 ? "takeoutbag.and.cup.and.straw.fill" : "takeoutbag.and.cup.and.straw")
                                        .font(.largeTitle)
                                        .foregroundStyle(.black)
                                    //.background(onsiteNTakeaway == 2 ? .black : .white)
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.leading, 35)
                        .padding(.trailing, 45)
                        
                        Divider()
                            .padding(.horizontal, 32)
                            .padding(.top)
                        
                        
                        HStack{
                            Text("Volume, ml")
                            Spacer()
                            HStack(spacing: 10){
                                VStack{
                                    Button{
                                        volume = 1
                                    }label: {
                                        Image(systemName: volume == 1 ? "waterbottle.fill" : "waterbottle" )
                                            .font(.title3)
                                            .foregroundStyle(.black)
                                    }
                                    
                                    Text("250")
                                        .font(.title2)
                                }
                                
                                VStack{
                                    Button{
                                        volume = 2
                                    }label: {
                                        Image(systemName: volume == 2 ? "waterbottle.fill" : "waterbottle" )
                                            .font(.title2)
                                            .foregroundStyle(.black)
                                    }
                                    
                                    Text("350")
                                        .font(.title2)
                                }
                                
                                VStack{
                                    Button{
                                        volume = 3
                                    }label: {
                                        Image(systemName: volume == 3 ? "waterbottle.fill" : "waterbottle" )
                                            .font(.title)
                                            .foregroundStyle(.black)
                                    }
                                    
                                    Text("450")
                                        .font(.title2)
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.leading, 35)
                        .padding(.trailing, 45)
                        
                        Divider()
                            .padding(.horizontal, 32)
                            .padding(.top)
                        
                        
                        HStack{
                            Text("Prepare by a certain time today?")
                                .padding(.top, -45)
                            
                            Spacer()
                            
                            VStack(spacing: 15){
                                
                                Toggle("", isOn: $isOn)
                                    .labelsHidden()
                                    .toggleStyle(SwitchToggleStyle(tint: .green))
                                    .padding(.horizontal)
                                
                                Text("18:20")
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .font(.title2)
                                    .background(Color.gray.opacity(0.5))
                                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                                
                                
                                
                            }
                        }
                        .padding(.top)
                        .padding(.leading, 35)
                        .padding(.trailing, 45)
                        
                        NavigationLink{
                            Designer(isFromAdditives: false)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("CoffeeLover")
                                .resizable()
                                .scaledToFill()
                                .padding(.top, 16)
                                .padding(.horizontal, 16)
                        }
                       
                        
                    
                        
                        
                    }
                    .padding(.top, 0)
                    Spacer()
                    
                    
                    
                }
            }
            
            VStack{
                HStack{
                    Text("Total Amount")
                        .bold()
                    Spacer()
                    Text(formattedPrice(coffee.price * Double(quantity)))
                        .bold()
                    
                }
                .padding(.horizontal, 35)
                
                Button {
                    orderManager.startOrder(
                        coffee: coffee,
                        quantity: quantity,
                        ristretto: ristrettoText,
                        serving: servingText,
                        volume: volumeText,
                        prepareTime: isOn ? "18:20" : nil
                    )
                    showBarista = true
                } label: {
                    Text("Next")
                }
                
                .padding()
                
                .frame(maxWidth: .infinity)
                .background(Color(red: 50/255, green: 74/255, blue: 89/255))
                
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.horizontal, 25)
                .padding(.bottom, 5)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationDestination(isPresented: $showBarista) {
            Barista()
                .navigationBarBackButtonHidden()
        }
    }

    private var ristrettoText: String {
        ristrettoOption == 1 ? "one ristretto" : "two ristretto"
    }

    private var servingText: String {
        onsiteNTakeaway == 1 ? "onsite" : "takeaway"
    }

    private var volumeText: String {
        switch volume {
        case 1:
            return "250 ml"
        case 2:
            return "350 ml"
        default:
            return "450 ml"
        }
    }

    private func formattedPrice(_ price: Double) -> String {
        String(format: "BYN %.2f", price)
    }
}


#Preview {
    OrderOptions(
        coffee: Coffee(
            id: 1,
            name: "Americano",
            price: 5.99,
            image: "americano"
        )
    )
    .environmentObject(OrderManager())
}
