//
//  RegisterViewModel.swift
//  Deers
//
//  Created by Dalal Macbook on 16/05/2023.
//

import Foundation
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    private var db = Firestore.firestore()
    @Published var email = ""
    var reviewCounter =  UserDefaults.standard.object(forKey: "counter") as! Int

    var isFieldEmpty: Bool{
        [email].contains(where: \.isEmpty)
    }

    var isRegisterComplete: Bool {
        if !Util.isEmailValid(email) || isFieldEmpty{
            return false
        } else {
            return true
        }
    }


    func registerEmail(){
        self.reviewCounter = self.reviewCounter + 1
        UserDefaults.standard.set( (self.reviewCounter), forKey: "counter")
        db.collection("Customer_Email").addDocument(data: ["id": self.reviewCounter, "email": email, "active": false]){ error in

            if error == nil{
                //no errors
                UserDefaults.standard.set( self.reviewCounter, forKey: "counter")
            }else {
                //handle error
            }

        }
        
    }
}
