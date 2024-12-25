//
//  DeersApp.swift
//  Deers
//
//  Created by Dalal Macbook on 26/04/2023.
//

import SwiftUI
import FirebaseCore

@main
struct DeersApp: App {

    init() {
        FirebaseApp.configure()
        reviewCountConfig()
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(isLoggedIn: isLoggedIn())
        }
    }

    // MARK: - methods
    private func isLoggedIn() -> Bool {
        if let isLoggedIn = UserDefaults.standard.object(forKey: "isLoggedIn") {
            return true
        }
        return false
    }

    private func reviewCountConfig() {
    UserDefaults.standard.set(1, forKey: "counter")
    }
}
