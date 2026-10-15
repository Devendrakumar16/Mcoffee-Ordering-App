//
//  CoffeeModel.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 02/06/26.
//

import Foundation

struct Coffee: Codable, Identifiable{
    let id: Int
    let name: String
    let price: Double
    let image: String
}

struct OrderItem: Identifiable {
    let id = UUID()
    let coffee: Coffee
    var quantity: Int
    var ristretto: String
    var serving: String
    var volume: String
    var prepareTime: String?
    var country: String?
    var coffeeSort: String?
    var additives: [String]
    var milk: String?
    var syrup: String?
    var coffeeBlend: String?
    var totalPrice: Double

    var details: String {
        [
            ristretto,
            serving,
            volume,
            prepareTime,
            country,
            coffeeSort,
            additives.isEmpty ? nil : additives.joined(separator: ", "),
            coffeeBlend,
            milk,
            syrup
        ]
        .compactMap { $0 }
        .filter { !$0.isEmpty && $0 != "select" }
        .joined(separator: " | ")
    }
}

struct OrderFirebase: Codable, Identifiable{
    let id: String
    let userID:String
    let coffeeName:String
    let price: Double
    let quantity: Int
    let createdAt: Date
}


