//
//  StartupScreen.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//

import SwiftUI

struct StartupScreen: View {

    @State private var navigate = false

    var body: some View {

        VStack {

            ZStack {

                Image("startupScreen")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                NavigationLink(
                    destination: Menu()
                        .navigationBarBackButtonHidden(true),

                    isActive: $navigate
                ) {
                    EmptyView()
                }
            }
            .onAppear {

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

                    navigate = true
                }
            }
        }
    }
}

#Preview {

    StartupScreen()
}
