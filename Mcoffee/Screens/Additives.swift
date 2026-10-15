//
//  Additives.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 01/06/26.
//

import SwiftUI

struct Additives: View {
    var onComplete: (() -> Void)?
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var orderManager: OrderManager
    @State private var showDesigner = false

    let toppings = [
        "Ceylon cinnamon",
        "Grated chocolate",
        "Liquid chocolate",
        "Marshmallow",
        "Whipped cream",
        "Cream",
        "Nutmeg",
        "Ice cream"
    ]
    @State private var selectedToppings: Set<String> = []
    var body: some View {
        VStack{
            HeaderView(title: "Coffee lover assemblage")
            ListHeader(title: "Select Additives")
            
            List(toppings, id: \.self) { top in
                Button {
                    if selectedToppings.contains(top) {
                        selectedToppings.remove(top)
                    } else {
                        selectedToppings.insert(top)
                    }
                } label: {
                    HStack {
                        Text(top)
                            .foregroundStyle(.primary)
                        Spacer()
                        if selectedToppings.contains(top) {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.tint)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 20)
            .listStyle(.plain)
            
            Spacer(minLength: 12)
            
            Button {
                orderManager.updateAdditives(Array(selectedToppings).sorted())
                showDesigner = true
            } label: {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedToppings.isEmpty ? Color.gray.opacity(0.3) : Color.accentColor)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            }
            .disabled(selectedToppings.isEmpty)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .navigationDestination(isPresented: $showDesigner) {
            Designer(isFromAdditives: true)
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    Additives()
        .environmentObject(OrderManager())
}
