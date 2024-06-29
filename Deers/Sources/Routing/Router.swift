//
//  Router.swift
//  Deers
//
//  Created by Dalal Macbook on 29/06/2024.
//

import Foundation
import SwiftUI


public class Router<T: Hashable>: ObservableObject {

    // MARK: - Properties
    @Published var root: T
    @Published var navPath = NavigationPath()

    // MARK: - Init
    init(root: T) {
        self.root = root
    }

        func push(to route: Routes) {
            navPath.append(route)
        }

        func navigateBack() {
            navPath.removeLast()
        }

        func navigateToRoot() {
            navPath.removeLast(navPath.count)
        }

    func replaceRoot(with root: T) {
        self.root = root
    }
}
