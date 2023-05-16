//
//  LoginView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var showPassword = false
    @Binding var navigateToHome:Bool
    @ObservedObject var loginVM = LoginViewModel()



    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                ZStack{
                    VStack(alignment: .center){
                        Spacer()
                        Image("background").resizable().scaledToFit().frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                        CustomEmailField(email: $loginVM.email)

                        CustomPasswordField(password: $loginVM.password, showPassword: $showPassword)

                        Button(action:  {
                            Task{
                              var res = await loginVM.login()
                                if res {
                                    navigateToHome.toggle()
                                }
                            }
                        } ){
                            Text(NSLocalizedString("login", comment: "")).font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor.opacity(!loginVM.isLoginComplete ? 0.3: 1)).padding(25)
                        }.background(.black.opacity(0.3)).cornerRadius(40).padding().disabled(!loginVM.isLoginComplete).alert(NSLocalizedString("credential_error", comment: ""), isPresented: $loginVM.showError) {
                            Button(NSLocalizedString("ok", comment: ""), role: .cancel) { }
                        }
                        HStack{
                            Text(NSLocalizedString("dont_have_account", comment: "")).foregroundColor(Constants.Colors.labelColor)
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

    }

    func submitLogin(){
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(navigateToHome: .constant(false))
    }
}
