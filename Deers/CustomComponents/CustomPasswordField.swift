//
//  CustomPasswordField.swift
//  Deers
//
//  Created by Dalal Macbook on 02/05/2023.
//

import SwiftUI

struct CustomPasswordField: View {
    @Binding var password : String
    @Binding var showPassword : Bool

    var body: some View {
        ZStack(alignment: Util().getReverseDir()){

            Group{
                if showPassword  {
                    TextField("password", text: $password,prompt: Text(NSLocalizedString("password", comment: ""))).TextFieldStyle()
                } else{
                    SecureField("password", text: $password,prompt: Text(NSLocalizedString("password", comment: ""))) .TextFieldStyle()
                }
            }

            Button(action: {
                showPassword.toggle()
            }){
                Image(systemName: showPassword ? "eye" : "eye.slash").imageScale(.large)
            }.padding(Util.getDirSet(), 25)
        }.padding([.top])
    }
}

struct CustomPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPasswordField(password: .constant(""), showPassword: .constant(false))
    }
}
