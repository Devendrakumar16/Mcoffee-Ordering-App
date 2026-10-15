//
//  Menu.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//

import SwiftUI

struct Menu: View {
    
    @StateObject private var viewModel = ViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var selectedIndex = 0
    @State private var selectedTab = 0
    var body: some View {

        VStack {

            TabView(selection: $selectedTab) {

                VStack(spacing: 0) {

                    // TOP SECTION
                    ZStack {

                        VStack(spacing: 2) {

                            Text("Welcome!")
                                .font(.system(size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.gray)

                            Text("Alex")
                                .font(.system(size: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .bold()
                        }
                        .padding(26)

                        HStack(spacing: 20) {

                            NavigationLink {
                                CartScreen()
                                    .navigationBarBackButtonHidden()
                            } label: {

                                Image(systemName: "cart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.black)
                            }
                            .accessibilityLabel("Cart")

                            NavigationLink {
                                ProfileScreen()
                                    .navigationBarBackButtonHidden()
                            } label: {

                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(33)
                    }

                    // BOTTOM SECTION
                    ZStack {

                        Color(
                            red: 44/255,
                            green: 67/255,
                            blue: 82/255
                        )
                        .ignoresSafeArea()

                        VStack(alignment: .leading, spacing: 20) {

                            Text("Select your coffee")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.top, 25)

                            ScrollView(showsIndicators: false) {

                                LazyVGrid(columns: columns, spacing: 16) {

                                    ForEach(viewModel.coffees) { coffee in


                                        NavigationLink {

                                            OrderOptions(coffee: coffee)
                                                .navigationBarBackButtonHidden(true)

                                        } label: {

                                            VStack(spacing: 12) {

                                                Image(coffee.image)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 90, height: 90)

                                                Text(coffee.name)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                            }
                                            .frame(height: 160)
                                            .frame(maxWidth: .infinity)

                                            .background(Color.white)

                                            .cornerRadius(18)

                                           
                                        }
                                        .buttonStyle(.plain)
                                    }
                                    .refreshable {
                                        await viewModel.fetchCoffee()
                                    }
                                }
                                
                                .padding(.bottom, 20)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 30,
                            topTrailingRadius: 30
                        )
                    )
                    .ignoresSafeArea()
                }

                .tabItem {

                    Label("", systemImage: "storefront")
                }
                .tag(0)

                RewardsScreen()
                    .tabItem {

                        Label("", systemImage: "gift")
                    }
                    .tag(1)

                NewsScreen()
                    .tabItem {

                        Label("", systemImage: "newspaper")
                    }
                    .tag(2)
            }
        }
        .task {
            await viewModel.fetchCoffee()
        }
    }
}

#Preview {

    Menu()
        .environmentObject(OrderManager())
}
