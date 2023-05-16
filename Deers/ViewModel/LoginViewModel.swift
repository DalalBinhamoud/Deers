//
//  LoginViewModel.swift
//  Deers
//
//  Created by Dalal Macbook on 11/05/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

@MainActor
class LoginViewModel: ObservableObject {
    private var db = Firestore.firestore()

    @Published var isLoggedIn = false
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false


    var areFieldsEmpty: Bool{
        [email,password].contains(where: \.isEmpty)
    }

    var isLoginComplete: Bool {
        if !Util.isEmailValid(email) || areFieldsEmpty {
                return false
            }
            return true
        }


    func login() async -> Bool {
      do {
        let authDataResult = try  await  Auth.auth().signIn(withEmail: email, password: password)
        let user = authDataResult.user
        print("Signed in as user \(user.uid), with email: \(user.email ?? "")")
        self.isLoggedIn = true
          UserDefaults.standard.set(true, forKey: "isLoggedIn")
      }
      catch {
          self.showError.toggle()
        print("There was an issue when trying to sign in: \(error)")
      }
        return self.isLoggedIn
    }

}
