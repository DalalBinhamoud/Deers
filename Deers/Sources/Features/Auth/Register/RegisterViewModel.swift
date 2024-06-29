//
//  RegisterViewModel.swift
//  Deers
//
//  Created by Dalal Macbook on 16/05/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

@MainActor
class RegisterViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPW = ""
    @Published var showErrorOfBE = false
    @Published var showErrorMsgOfBE = ""
    var reviewCounter =  UserDefaults.standard.object(forKey: "counter") as! Int

    var arFieldsEmpty: Bool{
        [email, password, confirmPW ].contains(where: \.isEmpty)
    }

    var isPasswordMatch: Bool{
        if password == confirmPW {
            return true
        } else {
            return false
        }
    }

    var isRegisterComplete: Bool {
        if !Util.isEmailValid(email) || arFieldsEmpty || !isPasswordMatch {
            return false
        } else {
            return true
        }
    }


    func signUp() async -> Bool{
        do{
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)

            if authResult != nil {
                self.db.collection("Users").addDocument(data: ["id": authResult.user.uid, "email": authResult.user.email])
            }

        } catch{
            print("an error occured: \(error.localizedDescription)")
            self.showErrorMsgOfBE = error.localizedDescription
            self.showErrorOfBE.toggle()
            return false
        }
        return true
    }
}
