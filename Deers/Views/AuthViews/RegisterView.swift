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
    @State private var showAlert = false


    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack(alignment: .center){
                    Spacer()
                    Image("background").resizable().scaledToFit().frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                    CustomEmailField(email: $registerVM.email)

                    Button(action:  {
                        registerVM.registerEmail()
                        showAlert.toggle()
                        dismiss()
                    } ){
                        Text(NSLocalizedString("register", comment: "")).font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor.opacity(!registerVM.isRegisterComplete ? 0.3: 1)).padding(25)
                    }.background(.black.opacity(0.3)).cornerRadius(40).padding().disabled(!registerVM.isRegisterComplete)
                        .alert(isPresented: $showAlert) {
                                    Alert(title: Text(NSLocalizedString("registration_request", comment: "")), message: Text(NSLocalizedString("registration_request_msg", comment: "")), dismissButton: .default(Text(NSLocalizedString("ok", comment: ""))))
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
