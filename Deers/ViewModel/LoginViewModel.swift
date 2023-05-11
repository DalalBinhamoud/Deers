//
//  LoginViewModel.swift
//  Deers
//
//  Created by Dalal Macbook on 11/05/2023.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn = false
    private var db = Firestore.firestore()

    @Published var email = ""
    @Published var password = ""


    func isEmailValid() -> Bool {
            let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                        "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
            return emailTest.evaluate(with: email)
        }

    var isLoginComplete: Bool {
            if !isEmailValid() {
                return false
            }
            return true
        }

    var emailPrompt: String {
         if isEmailValid() {
             return ""
         } else {
             return "Enter a valid email address"
         }
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
        print("There was an issue when trying to sign in: \(error)")
      }
        return self.isLoggedIn
    }

}
