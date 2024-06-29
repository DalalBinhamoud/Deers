//
//  MainView.swift
//  Deers
//
//  Created by Dalal Macbook on 26/04/2023.
//

import SwiftUI

struct MainView: View {

    @State private var navigateToHome = false

    var body: some View {

        if isLoggedIn() || navigateToHome {
            HomeView()
        } else{
            LoginView(navigateToHome: $navigateToHome)
        }
    }

    func isLoggedIn() -> Bool{
        let isLoggedIn = UserDefaults.standard.object(forKey: "isLoggedIn")
        if isLoggedIn != nil{
            return true
        }
        return false
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
