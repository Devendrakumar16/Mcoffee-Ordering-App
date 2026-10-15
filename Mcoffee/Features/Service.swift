//
//  CoffeeService.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 02/06/26.
//


import Foundation
import FirebaseFirestore
import FirebaseAuth

final class Service {

    private let db = Firestore.firestore()

    func fetchCoffees() async throws -> [Coffee] {

        print("""
        ====================
        GET /coffees
        ====================
        """)

        do {
            let snapshot = try await db
                .collection("coffees")
                .getDocuments()

            let coffees = snapshot.documents.compactMap { doc in
                makeCoffee(from: doc.data())
            }

            print("""
            ====================
            RESPONSE
            \(coffees)
            ====================
            """)

            if !coffees.isEmpty {
                return coffees
            }
        } catch {
            print("Firestore coffee fetch failed:", error)
        }

        return loadLocalCoffees()
    }

    private func makeCoffee(from data: [String: Any]) -> Coffee? {
        guard
            let id = data["id"] as? Int,
            let name = data["name"] as? String,
            let image = data["image"] as? String
        else {
            return nil
        }

        let price: Double
        if let doublePrice = data["price"] as? Double {
            price = doublePrice
        } else if let numberPrice = data["price"] as? NSNumber {
            price = numberPrice.doubleValue
        } else {
            price = 0
        }

        return Coffee(id: id, name: name, price: price, image: assetName(for: image))
    }

    private func assetName(for image: String) -> String {
        image
            .lowercased()
            .filter { $0.isLetter || $0.isNumber }
    }

    private func loadLocalCoffees() -> [Coffee] {
        guard let url = Bundle.main.url(forResource: "coffee", withExtension: "json") else {
            return Self.defaultCoffees
        }

        do {
            let data = try Data(contentsOf: url)
            let coffees = try JSONDecoder().decode([Coffee].self, from: data)
            return coffees.map { coffee in
                Coffee(
                    id: coffee.id,
                    name: coffee.name,
                    price: coffee.price,
                    image: assetName(for: coffee.image)
                )
            }
        } catch {
            print("Local coffee load failed:", error)
            return Self.defaultCoffees
        }
    }

    private static let defaultCoffees = [
        Coffee(id: 1, name: "Americano", price: 5.99, image: "americano"),
        Coffee(id: 2, name: "Cappuccino", price: 6.49, image: "cappuccino"),
        Coffee(id: 3, name: "Latte", price: 4.99, image: "latte"),
        Coffee(id: 4, name: "Flat White", price: 5.49, image: "flatwhite"),
        Coffee(id: 5, name: "Raf", price: 6.99, image: "raf"),
        Coffee(id: 6, name: "Espresso", price: 5.79, image: "espresso")
    ]
}

final class AuthService {

    func login(
        email: String,
        password: String
    ) async throws {

        print("""
        ====================
        POST /login

        PARAMS
        email: \(email)
        password: \(password)
        ====================
        """)

        let result = try await Auth.auth().signIn(
            withEmail: email,
            password: password
        )

        print("""
        ====================
        RESPONSE
        uid: \(result.user.uid)
        email: \(result.user.email ?? "")
        ====================
        """)
    }

    func signup(
        email: String,
        password: String,
        mobile: String,
        name: String
    ) async throws {

        print("""
        ====================
        POST /signup

        PARAMS
        name: \(name)
        email: \(email)
        mobile: \(mobile)
        ====================
        """)

        let result = try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )

        print("""
        ====================
        RESPONSE
        uid: \(result.user.uid)
        email: \(result.user.email ?? "")
        ====================
        """)
    }
}
