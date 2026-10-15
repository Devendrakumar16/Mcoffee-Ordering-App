//
//  CommonViews.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 26/05/26.
//


import SwiftUI

struct HeaderView: View {

    @Environment(\.dismiss) var dismiss

    var title: String

    var body: some View {

        HStack {

            Button {

                dismiss()

            } label: {

                Image(systemName: "arrow.left")
                    .foregroundStyle(.black)
            }

            Spacer()

            Text(title)

            Spacer()

            NavigationLink {
                CartScreen()
                    .navigationBarBackButtonHidden()
            } label: {
                Image(systemName: "cart")
                    .foregroundStyle(.black)
            }
            .accessibilityLabel("Cart")
        }
        .font(.title3)
        .padding(.vertical)
        .padding(.horizontal, 26)
    }
}


struct ListHeader:View {
    
    var title: String
    var body: some View {
        Text(title)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            //.background(.gray.opacity(0.2))
            .padding(.top, 10)
            .padding(.bottom, -8.5)
    }
}
