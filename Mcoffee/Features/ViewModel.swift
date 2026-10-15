//
//  ViewModel.swift
//  Mcoffee
//

//
//  ViewModel.swift
//  Mcoffee
//

import Foundation
import Combine
import FirebaseAuth

@MainActor
final class ViewModel: ObservableObject {

    // MARK: - Coffee

    @Published var coffees: [Coffee] = []

    private let service = Service()

    func fetchCoffee() async {
        do {
            coffees = try await service.fetchCoffees()
        } catch {
            print("Coffee Error:", error)
        }
    }

    // MARK: - Auth

    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var mobile = ""

    @Published var isLoggedIn = false

    init() {
        checkLoginStatus()
    }

    func login() async {

        do {

            let result = try await Auth.auth().signIn(
                withEmail: email,
                password: password
            )

            print("Login Success:", result.user.email ?? "")

            isLoggedIn = true

        } catch {

            print("Login Error:", error)
        }
    }

    func signUp() async {

        do {

            let result = try await Auth.auth().createUser(
                withEmail: email,
                password: password
            )

            print("Signup Success:", result.user.email ?? "")

            isLoggedIn = true

        } catch {

            print("Signup Error:", error)
        }
    }

    func logout() {

        do {

            try Auth.auth().signOut()

            isLoggedIn = false

        } catch {

            print("Logout Error:", error)
        }
    }

    func checkLoginStatus() {

        isLoggedIn = Auth.auth().currentUser != nil

        print("Current User:", Auth.auth().currentUser?.email ?? "No User")
    }
}
