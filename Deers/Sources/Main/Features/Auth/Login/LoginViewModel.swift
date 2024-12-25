//
//  LoginViewModel.swift
//  Deers
//
//  Created by Dalal Macbook on 11/05/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Combine

class LoginViewModel: LoginViewModelProtocol {
    private var db = Firestore.firestore()

    @Published var isLoggedIn = false
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false
    @Published var errorMessage = ""

    var onLogin: () -> Void

    init(onLogin: @escaping () -> Void) {
        self.onLogin = onLogin
    }

    var areFieldsEmpty: Bool{
        [email,password].contains(where: \.isEmpty)
    }

    func login() async -> Bool {
      do {
          // TODO: move service logic
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

    func performLogin() async {
    if areFieldsEmpty {
            showError.toggle()
            errorMessage = String(localized: "required_fields_error")
        } else if !Util.isEmailValid(email) {
            showError.toggle()
            errorMessage = String(localized: "email_validation")
        } else {
            _ = await login()
                onLogin()
        }
    }

}

extension DocumentReference {
    func toAnyPublisher<T: Decodable>() -> AnyPublisher<T?, Error> {
        let subject = CurrentValueSubject<T?, Error>(nil)

        let listener = addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                subject.send(completion: .failure(error!))
                return
            }

            guard let data = try? document.data() else {
                subject.send(nil)
                return
            }
        }

        return subject.handleEvents(receiveCancel: {
            listener.remove()
        }).eraseToAnyPublisher()
    }
}
