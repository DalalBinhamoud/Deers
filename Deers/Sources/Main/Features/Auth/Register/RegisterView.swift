//
//  RegisterView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var registerVM = RegisterViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var showAlert = false
    @State private var showError = false
    @State private var errorMsg = ""


    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack(alignment: .center){
                    Spacer()
                    Image("background").resizable().scaledToFit().frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                    CustomEmailField(email: $registerVM.email)

                    // password field
                    CustomPasswordField(password: $registerVM.password, showPassword: $showPassword)

                    // confirm password field
                    CustomPasswordField(password: $registerVM.confirmPW, showPassword: $showConfirmPassword)

                    Button(action:  {
                        Task{
                            if registerVM.isRegisterComplete {
                               var res = await registerVM.signUp()
                                if res {
                                    showAlert.toggle()
                                    registerVM.email = ""
                                    registerVM.password = ""
                                    registerVM.confirmPW = ""
                                    dismiss()
                                }
                            } else if  registerVM.arFieldsEmpty {
                                showError.toggle()
                                errorMsg = "required_fields_error"

                            } else if  !registerVM.isPasswordMatch {
                                showError.toggle()
                                errorMsg = "password_mismatch_error"

                            } else if !Util.isEmailValid(registerVM.email){
                                showError.toggle()
                                errorMsg = "email_validation"
                            }
                        }

                    } ){
                        Text(NSLocalizedString("register", comment: "")).btnLabelTextStyle()
                    }.background(.black.opacity(0.3)).cornerRadius(40).padding()
                        .alert(NSLocalizedString("error", comment: ""), isPresented: $showError){
                            Button(NSLocalizedString("close", comment: "")){}
                        } message:{
                            Text(NSLocalizedString(errorMsg, comment: ""))
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text(NSLocalizedString("registration_request", comment: "")), message: Text(NSLocalizedString("registration_request_msg", comment: "")), dismissButton: .default(Text(NSLocalizedString("ok", comment: ""))))
                        }
                        .alert(NSLocalizedString("error", comment: ""), isPresented: $registerVM.showErrorOfBE){
                            Button(NSLocalizedString("close", comment: "")){}
                        } message:{
                            Text(registerVM.showErrorMsgOfBE)
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
