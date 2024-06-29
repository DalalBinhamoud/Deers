//
//  RouterView.swift
//  Deers
//
//  Created by Dalal Macbook on 29/06/2024.
//

import SwiftUI

struct RouterView<T: Hashable, Content: View>: View {

    @ObservedObject var router: Router<T>
    @ViewBuilder var buildView: (T) -> Content

    // MARK: - body
    var body: some View {
        NavigationStack(path: $router.navPath) {
            buildView(router.root)
            .navigationDestination(for: T.self) { path in
                buildView(path)
            }
        }
        .environmentObject(router)
    }
}
