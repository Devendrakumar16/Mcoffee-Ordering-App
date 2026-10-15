//
//  Designer.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 01/06/26.
//


//
//  Designer.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 14/05/26.
//


import SwiftUI

struct Designer:View {
    
    @State private var isOn = true
    @State private var value: Double = 50
    @State private var selectedMilk = "select"
    @State private var selectedSyrup = "select"
    @State private var showAdditives = false
    @State private var showEncyclopedia = false
    @State private var showCart = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var orderManager: OrderManager
    
    @State private var isFromAdditives: Bool
    
    init(isFromAdditives: Bool) {
        self._isFromAdditives = State(initialValue: isFromAdditives)
    }
    
    let milk = ["Regular",
                "Cow's",
                "Lactose-free",
                "Skimmed",
                "Vegatable"
                
    ]
    
    let syrup = ["Regular",
                 "Amaretto",
                 "Coconut",
                 "Vanilla",
                 "Caramel"
                 
    ]
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack{
                HeaderView(title: "Coffee lover assemblage")
                ScrollView{
                    VStack{
                        
                    VStack{
                        HStack{
                            Text("Select a barista")
                            Spacer()
                            
                            HStack(spacing: 16){
                                
                                Button {
                                    showAdditives = true
                                } label: {
                                    Image(systemName: "chevron.forward")
                                }
                                .padding(.horizontal, 5)
                                .foregroundStyle(.black)
                                
                                
                                
                                
                                
                            }
                            
                            
                        }
                        .padding(.top, 10)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        HStack{
                            Text("Coffee")
                            
                            Spacer()
                            VStack{
                                Slider(value: $value, in: 0...100)
                                //.frame(width: 150)
                                
                                
                                HStack{
                                    
                                    Text("Arabica")
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    Text("Robusta")
                                        .foregroundColor(.gray)
                                }
                                
                            }
                            .padding(.leading, 45)
                            
                            
                        }
                        .padding(.top,5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        HStack{
                            Text("Coffee sort")
                            Spacer()
                            
                            HStack(spacing: 16){
                                
                                Button{
                                    
                                }label: {
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(.black)
                                }
                                .padding(.horizontal, 5)
                                .foregroundStyle(.black)
                                
                                
                                
                                
                                
                            }
                            .padding(5)
                            
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 32)
                            .padding(.top)
                        
                        
                        HStack{
                            Text("Roasting")
                            Spacer()
                            HStack(spacing: 20){
                                VStack{
                                    Button{
                                        
                                    }label: {
                                        Image(systemName: "flame.fill")
                                            .font(.title3)
                                            .foregroundStyle(.yellow)
                                    }
                                }
                                
                                
                                VStack{
                                    Button {
                                        
                                    } label: {
                                        
                                        HStack(spacing: 4) {
                                            
                                            Image(systemName: "flame.fill")
                                            
                                            Image(systemName: "flame.fill")
                                        }
                                        .font(.title3)
                                        .foregroundStyle(.yellow)
                                    }
                                }
                                
                                VStack{
                                    Button {
                                        
                                    } label: {
                                        
                                        VStack(spacing: 4) {
                                            
                                            Image(systemName: "flame.fill")
                                            HStack{
                                                Image(systemName: "flame.fill")
                                                Image(systemName: "flame.fill")
                                            }
                                        }
                                        .font(.title3)
                                        .foregroundStyle(.yellow)
                                    }
                                }
                            }
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        
                        
                        HStack{
                            Text("Grinding")
                            Spacer()
                            HStack(spacing: 40){
                                Button{
                                    
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .font(.title)
                                        .foregroundStyle(.black)
                                    
                                }
                                
                                Button{
                                    
                                } label: {
                                    Image(systemName: "gearshape.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.black)
                                    
                                }
                            }
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        HStack{
                            Text("Milk")
                            Spacer()
                            
                            Picker("Select", selection: $selectedMilk) {
                                
                                ForEach(milk, id: \.self) { milk in
                                    
                                    Text(milk)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.black)
                            //                            Button("Select"){
                            //
                            //                            }
                            //                            .padding(.horizontal, 5)
                            //                            .foregroundStyle(.black)
                            
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        HStack{
                            Text("Syrup")
                            Spacer()
                            
                            
                            Picker("Select", selection: $selectedSyrup) {
                                
                                ForEach(syrup, id: \.self) { syrup in
                                    
                                    Text(syrup)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.black)
                            
                            //                            Button("Select"){
                            //
                            //                            }
                            //                            .padding(.horizontal, 5)
                            //                            .foregroundStyle(.black)
                            
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        
                        
                        HStack{
                            Text("Addictive")
                            Spacer()
                            
                            HStack(spacing: 16){
                                
                                Button{
                                    
                                }label: {
                                    Image(systemName: "chevron.forward")
                                }
                                .padding(.horizontal, 5)
                                .foregroundStyle(.black)
                                
                            }
                            .padding(5)
                            
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        Divider()
                            .padding(.horizontal, 20)
                            .padding(.top)
                        
                        HStack{
                            Text("Roasting")
                            Spacer()
                            HStack(spacing: 20){
                                VStack{
                                    Button{
                                        
                                    }label: {
                                        Image(systemName: "cube")
                                            .font(.title3)
                                            .foregroundStyle(.gray)
                                    }
                                }
                                
                                
                                VStack{
                                    Button {
                                        
                                    } label: {
                                        
                                        HStack(spacing: 4) {
                                            
                                            Image(systemName: "cube")
                                            
                                            Image(systemName: "cube")
                                        }
                                        .font(.title3)
                                        .foregroundStyle(.gray)
                                    }
                                }
                                
                                VStack{
                                    Button {
                                        
                                    } label: {
                                        
                                        VStack(spacing: 4) {
                                            
                                            Image(systemName: "cube")
                                            HStack{
                                                Image(systemName: "cube")
                                                Image(systemName: "cube")
                                            }
                                        }
                                        .font(.title3)
                                        .foregroundStyle(.gray)
                                    }
                                }
                            }
                        }
                        .padding(.top, 5)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
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
                        Text("BYN 3.00")
                            .bold()
                        
                    }
                    .padding(.horizontal, 35)
                    
                    Button("Next") {
                        orderManager.finishOrder(
                            milk: selectedMilk,
                            syrup: selectedSyrup,
                            coffeeBlend: coffeeBlendText
                        )
                        showCart = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                }
                .padding(.bottom, 45)
            }
            
            if isFromAdditives {
                VStack(spacing: 30){
                    Text("Coffee lover's encyclopedia")
                        .padding(.top, 20)
                    Text("A blend of 90% Arabica and 10% Robusta is considered a classic Italian espresso. We do not recommend creating a blend with a robusta content of more than 30%.")
                        //.padding(.top, 15)
                        .padding(.leading, 36)
                        .padding(.trailing, 42)
                        .font(.custom("Segoe Print", size: 16))
                    HStack{
                        Button("Skip"){
                            self.isFromAdditives = false
                        }
                        Spacer()
                        NavigationLink("Next"){
                            
                        }
                    }
                    .padding(.top, 45)
                    .padding(.horizontal, 45)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 37)
                .background(Color.pink)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 50,
                        topTrailingRadius: 50
                    )
                )
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationDestination(isPresented: $showAdditives) {
            Additives {
                showAdditives = false
                showEncyclopedia = true
            }
            .navigationBarBackButtonHidden()
        }
        .navigationDestination(isPresented: $showCart) {
            CartScreen()
                .navigationBarBackButtonHidden()
        }
        
    }

    private var coffeeBlendText: String {
        let robusta = Int(value.rounded())
        let arabica = 100 - robusta
        return "\(arabica)% Arabica, \(robusta)% Robusta"
    }
}

#Preview {
    Designer(isFromAdditives: true)
        .environmentObject(OrderManager())
}
