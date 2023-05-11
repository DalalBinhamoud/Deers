//
//  LoginView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var showPassword = false
    @State private var showError = false

    @ObservedObject var loginVM = LoginViewModel()


    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack(alignment: .center){
                    Spacer()
                    Image("background").resizable().scaledToFit().frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                    TextField("email", text: $loginVM.email , prompt: Text(NSLocalizedString("email", comment: ""))).TextFieldStyle()

                    // password field
                    CustomPasswordField(password: $loginVM.password, showPassword: $showPassword)

                    Button(action:  {
                        Task{
                            await loginVM.login()
                        }
                    } ){
                        Text(NSLocalizedString("login", comment: "")).font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor).padding(25)
                    }.background(.black.opacity(0.3)).cornerRadius(40).padding().disabled(!loginVM.isLoginComplete).alert(NSLocalizedString("credintial_error", comment: ""), isPresented: $showError) {
                        Button(NSLocalizedString("ok", comment: ""), role: .cancel) { }
                    }
                    HStack{
                        Text(NSLocalizedString("dont_have_account", comment: ""))
                        NavigationLink{
                            RegisterView()
                        } label: {
                            Text(NSLocalizedString("register", comment: ""))
                        }

                    }

                    Spacer()
                }.padding()
            }.background(Constants.Colors.secondaryColor)
        }
    }

    func submitLogin(){
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
