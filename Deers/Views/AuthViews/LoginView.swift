//
//  LoginView.swift
//  Deers
//
//  Created by Dalal Macbook on 01/05/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var  password = ""
    @State private var showPassword = false
    @State private var showError = false
    var util = Util()

    var isSigninButtonDisabled: Bool{
        [username,password].contains(where: \.isEmpty)
    }

    var body: some View {
        GeometryReader{ geo in
            ZStack{
            VStack(alignment: .center){
                Spacer()
                Image("background").resizable().scaledToFit().frame(width: geo.size.width * 0.3, height: geo.size.height * 0.3)

                TextField("username", text: $username , prompt: Text(NSLocalizedString("username", comment: ""))).TextFieldStyle()

                // password field
                ZStack(alignment: util.getDir()){

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
                    }.padding(util.getDirSet(), 25)
                }.padding([.top])

                Button(action:  {
                   print("logged in")
                } ){
                    Text(NSLocalizedString("login", comment: "")).font(.system(size: Constants.customFontSize.largeTxt)).foregroundColor(Constants.Colors.labelColor).padding(25)
                }.background(.black.opacity(0.3)).cornerRadius(40).padding().disabled(isSigninButtonDisabled).alert(NSLocalizedString("credintial_error", comment: ""), isPresented: $showError) {
                    Button(NSLocalizedString("ok", comment: ""), role: .cancel) { }
                }

                Spacer()
            }.padding()
            }.background(Constants.Colors.secondaryColor)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
