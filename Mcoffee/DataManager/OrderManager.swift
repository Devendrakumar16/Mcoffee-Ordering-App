//
//  OrderManager.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 04/06/26.
//
import Foundation
import Combine

@MainActor
final class OrderManager: ObservableObject {

    @Published var currentCoffee: Coffee?
    @Published var orders: [OrderItem] = []
    private var pendingOrder: OrderItem?

    func startOrder(
        coffee: Coffee,
        quantity: Int,
        ristretto: String,
        serving: String,
        volume: String,
        prepareTime: String?
    ) {
        currentCoffee = coffee
        pendingOrder = OrderItem(
            coffee: coffee,
            quantity: quantity,
            ristretto: ristretto,
            serving: serving,
            volume: volume,
            prepareTime: prepareTime,
            country: nil,
            coffeeSort: nil,
            additives: [],
            milk: nil,
            syrup: nil,
            coffeeBlend: nil,
            totalPrice: coffee.price * Double(quantity)
        )
    }

    func updateCountry(_ country: String) {
        pendingOrder?.country = country
    }

    func updateCoffeeSort(_ coffeeSort: String) {
        pendingOrder?.coffeeSort = coffeeSort
    }

    func updateAdditives(_ additives: [String]) {
        pendingOrder?.additives = additives
    }

    func finishOrder(milk: String?, syrup: String?, coffeeBlend: String?) {
        guard var order = pendingOrder else { return }

        order.milk = milk
        order.syrup = syrup
        order.coffeeBlend = coffeeBlend
        orders.append(order)

        pendingOrder = nil
        currentCoffee = nil
    }

    func removeOrder(id: UUID) {
        orders.removeAll { $0.id == id }
    }

    var totalPrice: Double {
        orders.reduce(0) { $0 + $1.totalPrice }
    }
}

