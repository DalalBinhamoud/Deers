//
//  RegisterView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var  password = ""
    @State private var  confirmPassword = ""
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var showError = false

    var isRegisterButtonDisabled: Bool{
        [email,password,confirmPassword].contains(where: \.isEmpty)
    }


    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack(alignment: .center){
                    Spacer()
                    Image("background").resizable().scaledToFit().frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                    TextField("email", text: $email , prompt: Text(NSLocalizedString("email", comment: ""))).TextFieldStyle()

                    // password field
                    CustomPasswordField(password: $password, showPassword: $showPassword)

                    // confirm password field
                    CustomPasswordField(password: $confirmPassword, showPassword: $showConfirmPassword)

                    Button(action:  {
                       print("registered")
                    } ){
                        Text(NSLocalizedString("register", comment: "")).font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor).padding(25)
                    }.background(.black.opacity(0.3)).cornerRadius(40).padding().disabled(isRegisterButtonDisabled).alert(NSLocalizedString("confirm_password_error", comment: ""), isPresented: $showError) {
                        Button(NSLocalizedString("ok", comment: ""), role: .cancel) { }
                    }

                    Spacer()
                }.padding()
            }.background(Constants.Colors.secondaryColor)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
