//
//  AppCoordinatorView.swift
//  Deers
//
//  Created by Dalal Macbook on 29/06/2024.
//

import SwiftUI

struct AppCoordinatorView: View {

    // MARK: - Props
    @ObservedObject var router: Router<Routes>

    // MARK: - Init
    init(isLoggedIn: Bool) {
        self.router = Router<Routes>(root: isLoggedIn ? .home : .login)
    }

    // MARK: - body
    var body: some View {
        RouterView(router: router) { route in
            switch route {
            case .login:
                LoginView()
            case .register:
                RegisterView()
            case .home:
                HomeView()

            }
        }
    }
}
