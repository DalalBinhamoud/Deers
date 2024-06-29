//
//  LoginView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct LoginView: View {

    @EnvironmentObject var router: Router<Routes> // TODO: execute the router in coordinator only
    @State private var showPassword = false
    @State private var showError = false
    @State private var errorMsg = ""
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
                                if loginVM.isLoginComplete {
                                    var res = await loginVM.login()
                                      if res {
                                          router.replaceRoot(with: .home)
                                      }
                                } else if  loginVM.areFieldsEmpty {
                                    showError.toggle()
                                    errorMsg = "required_fields_error"
                                } else if !Util.isEmailValid(loginVM.email){
                                    showError.toggle()
                                    errorMsg = "email_validation"
                                }

                            }
                        } ){
                            Text(NSLocalizedString("login", comment: "")).btnLabelTextStyle()
                        }.background(.black.opacity(0.3)).cornerRadius(40).padding().alert(NSLocalizedString("credential_error", comment: ""), isPresented: $loginVM.showError) {
                            Button(NSLocalizedString("ok", comment: ""), role: .cancel) { }
                        }
                        HStack{
                            Text(NSLocalizedString("dont_have_account", comment: "")).foregroundColor(Constants.Colors.labelColor)

                            Button(NSLocalizedString("register", comment: "")) {
                                router.push(to: .register)
                            }

                        }

                        Spacer()
                    }.padding()
                }.background(Constants.Colors.secondaryColor)

            }  .alert(NSLocalizedString("error", comment: ""), isPresented: $showError){
                Button(NSLocalizedString("close", comment: "")){}
            } message:{
                Text(NSLocalizedString(errorMsg, comment: ""))
            }
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
