//
//  McoffeeApp.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//

import SwiftUI

@main
struct McoffeeApp: App {

    @StateObject private var viewModel = ViewModel()
    @StateObject private var orderManager = OrderManager()

    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var delegate

    var body: some Scene {

        WindowGroup {

            if viewModel.isLoggedIn {
                NavigationStack{
            Menu()
                }
            } else {
                Authorization()
            }
        }
        .environmentObject(viewModel)
        .environmentObject(orderManager)
    }
}
