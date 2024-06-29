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

    func reviewCountConfig(){
    UserDefaults.standard.set(1, forKey: "counter")
    }


    init() {
        FirebaseApp.configure()
        reviewCountConfig()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
