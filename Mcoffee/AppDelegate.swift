//
//  AppDelegate.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 02/06/26.
//

import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        FirebaseApp.configure()
        print("Hellow")
        

        return true
    }
}
